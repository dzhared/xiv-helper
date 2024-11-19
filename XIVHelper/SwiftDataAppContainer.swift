import Foundation
import SwiftData

/// The live SwiftData model container for the app. This does a few things:
/// 1. Create a store from the bundle's files and try to create a store from the document directory.
/// 2. Check if the document directory has a store already. If not, copy the bundle store over.
/// 3. If there is a store in the documents directory, check if it differs from the bundle's. If so,
///   copy the bundle container to the documents directory and migrate the existing user recipes.
/// 4. Check if no store exists in the documents directory. If so, it create one from scratch.
/// 5. As a fallback, just return the bundle's container. This shouldn't happen, but it's better
///   than nothing.
@MainActor let appContainer: ModelContainer = {
    // Check if store already exists. If so, and if it matches the bundle, return it.
    let currentStoreName = SettingsManager.shared.currentStoreName
    let bundleStoreName = "xivhelper-2.4.0"

    // Create a store from the bundle if needed.
    let bundleContainer = createBundleContainer(filename: bundleStoreName)

    // An optional document container. Initialize it once to avoid multiple operations.
    let documentContainer = createDocumentContainer(filename: currentStoreName)

    // There is no current store. Copy bundle container over.
    if documentContainer == nil {
        do {
            try copyBundleToDocument(bundleStoreName: bundleStoreName)
            SettingsManager.shared.currentStoreName = bundleStoreName
        } catch {
            // Fail silently.
        }
    }

    // Current store name does not match bundle store name. Migrate.
    if currentStoreName != bundleStoreName {
        // Check if current store is out of date, or uses the old naming convention (`xivhelper`).
        if let documentContainer = documentContainer ?? createDocumentContainer(filename: "xivhelper") {
            var idsAndQuantities: [(id: Int, quantity: Int)] = []
            do {
                // Retrieve the UserRecipe IDs and quantities to migrate into the new store.
                let descriptor = FetchDescriptor<UserRecipe>()
                let currentUserRecipes = try documentContainer.mainContext.fetch(descriptor)
                idsAndQuantities = currentUserRecipes.map {
                    ($0.recipe.id, $0.quantity)
                }

                // Copy the bundle store to the documents directory.
                try copyBundleToDocument(bundleStoreName: bundleStoreName)

                // Remove the old store from the documents directory.
                removeStoreFromDocuments(currentStoreName: currentStoreName)
            } catch {
                // Fail silently.
            }

            // If new container was successfully created, re-add the user recipes, update the
            // SettingsManager's currentStoreName, and return the migrated document container.
            if let newDocumentContainer = createDocumentContainer(filename: bundleStoreName) {
                addUserRecipes(to: newDocumentContainer, idsAndQuantities: idsAndQuantities)
                SettingsManager.shared.currentStoreName = bundleStoreName
                return newDocumentContainer
            }
        }
    }

    // Return the container if it exists or has been updated on this launch.
    if SettingsManager.shared.currentStoreName == bundleStoreName,
       let documentContainer = createDocumentContainer(filename: bundleStoreName) {
        return documentContainer
    }

    // As a fallback, just return the read-only bundle container.
    return bundleContainer
}()

/// From the given recipe IDs and quantities, reconstruct the existing UserRecipes in a given model container.
///
/// - Parameters:
///   - modelContainer: The model container to which the UserRecipe objects should be added.
///   - idsAndQuantities: The IDs and quantities of the recipes.
///
@MainActor fileprivate func addUserRecipes(
    to modelContainer: ModelContainer,
    idsAndQuantities: [(id: Int, quantity: Int)]
) {
    for idAndQuantity in idsAndQuantities {
        let id = idAndQuantity.id
        var descriptor = FetchDescriptor(predicate: #Predicate<Recipe> { $0.id == id })
        descriptor.fetchLimit = 1
        if let result: Recipe = try? modelContainer.mainContext.fetch(descriptor).first {
            modelContainer.mainContext.insert(
                UserRecipe(recipe: result, quantity: idAndQuantity.quantity)
            )
        }
    }
}

/// Copies the bundle store to the documents directory.
///
/// - Parameter bundleStoreName: The name of the store, without the `.store` extension.
/// - Throws: If the document directory construction or copy process fails.
///
fileprivate func copyBundleToDocument(bundleStoreName: String) throws {
    let fileManager = FileManager.default

    guard let bundleURL = Bundle.main.url(
        forResource: bundleStoreName,
        withExtension: "store"
    ) else {
        return
    }

    let documentDirectoryURL = try fileManager.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    )
    let documentURL = documentDirectoryURL.appendingPathComponent("\(bundleStoreName).store")

    if !fileManager.fileExists(atPath: documentURL.path()) {
        try fileManager.copyItem(at: bundleURL, to: documentURL)
    }
}

/// Returns a SwiftData model container from the bundle for the given filename.
///
/// - Parameter filename: The filename without extension for the bundle store.
/// - Returns: The model container from the bundle.
///
fileprivate func createBundleContainer(filename: String) -> ModelContainer {
    guard let bundleURL = Bundle.main.url(forResource: filename, withExtension: "store") else {
        fatalError("Failed to find bundle store in app bundle.")
    }
    let bundleConfig = ModelConfiguration(url: bundleURL, allowsSave: false)
    guard let bundleContainer = try? ModelContainer(
        for: Item.self, Recipe.self, UserRecipe.self,
        configurations: bundleConfig) else {
        fatalError("Failed to create SwiftData bundle container.")
    }
    return bundleContainer
}

/// Returns a SwiftData model container from the document directory for the given filename.
///
/// - Parameter filename: The filename without extension for the store.
/// - Returns: The optional model container for the store.
///
fileprivate func createDocumentContainer(filename: String) -> ModelContainer? {
    let fileManager = FileManager.default
    guard let documentDirectoryURL = try? fileManager.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ) else {
        // Failed to find directory URL.
        return nil
    }
    let documentURL = documentDirectoryURL.appendingPathComponent("\(filename).store")

    guard fileManager.fileExists(atPath: documentURL.path()) else { return nil }

    let documentConfiguration = ModelConfiguration(url: documentURL, allowsSave: true)
    let documentContainer = try? ModelContainer(
        for: Item.self, Recipe.self, UserRecipe.self,
        configurations: documentConfiguration
    )

    if let documentContainer {
        // Created document container. Return it.
        return documentContainer
    } else {
        // Failed to create document container for \(filename). Return nil.
        return nil
    }
}

/// Attempts to remove a `.store` file with a given name from the document directory.
///
/// - Parameter currentStoreName: The filename, e.g. `xivhelper` or `xivhelper-2.3.0`. No extension.
///
fileprivate func removeStoreFromDocuments(currentStoreName: String) {
    let fileManager = FileManager.default
    guard let documentDirectoryURL = try? fileManager.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ) else {
        // Failed to find directory URL.
        return
    }
    let documentURL = documentDirectoryURL.appendingPathComponent("\(currentStoreName).store")

    guard fileManager.fileExists(atPath: documentURL.path()) else { return }

    // Remove the old store.
    try? fileManager.removeItem(atPath: documentURL.path())
}

#if DEBUG
/// The ModelContainer used for Xcode Previews.
@MainActor
let previewContainer: ModelContainer = {

    /// The name and extension of the database in the app bundle.
    let bundleStoreName = "xivhelper-2.4.0"

    do {
        /// Retrieve the prebuilt, read-only store from the app bundle.
        guard let bundleURL = Bundle.main.url(
            forResource: bundleStoreName,
            withExtension: "store"
        ) else {
            fatalError("Failed to find \(bundleStoreName).store in app bundle")
        }

        /// Return the read-only store.
        let config = ModelConfiguration(url: bundleURL, allowsSave: true)
        let container = try ModelContainer(
            for: Item.self, Recipe.self, UserRecipe.self,
            configurations: config
        )
        return container
    } catch {
        fatalError("Failed to create preview container: \(error)")
    }
}()
#endif
