import Foundation
import SwiftData

/// The ModelContainer used for the live app.
@MainActor
let appContainer: ModelContainer = {
    do {
        /// Construct URL of store in bundle.
        let documentStoreName = "xivhelper"
        let bundleStoreName = "xivhelper-2.3.0"
        let bundleStoreExtension = "store"
        guard let bundleURL = Bundle.main.url(forResource: bundleStoreName, withExtension: bundleStoreExtension) else {
            fatalError("Failed to find \(bundleStoreName).\(bundleStoreExtension) in app bundle.")
        }

        /// Find the existing store in the documents directory.
        let fileManager = FileManager.default
        let documentDirectoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let documentURL = documentDirectoryURL.appendingPathComponent("\(documentStoreName).\(bundleStoreExtension)")

        /// Copy file to document directory if it does not exist.
        if !fileManager.fileExists(atPath: documentURL.path()) {
            try fileManager.copyItem(at: bundleURL, to: documentURL)
        }

        /// Create model container.
        let documentConfig = ModelConfiguration(url: documentURL, allowsSave: true)
        var documentContainer = try ModelContainer(for: Item.self, Recipe.self, UserRecipe.self, configurations: documentConfig)

        /// Check if a store already exists there. Should be something like `xivhelper-2.0.0`.
        let currentStoreName = SettingsManager.shared.currentStoreName
        let currentStoreExtension = "store"

        /// Bundle store name does not match current store name. Update current store.
        if bundleStoreName != currentStoreName {

            /// Retrieve current user recipes. These will be updated and inserted into new context.
            let descriptor = FetchDescriptor<UserRecipe>()
            let currentUserRecipes: [UserRecipe] = try documentContainer.mainContext.fetch(descriptor)

            /// Attempt to update user recipes from new store.
            let bundleConfig = ModelConfiguration(url: bundleURL, allowsSave: false)
            let bundleContainer = try ModelContainer(for: Item.self, Recipe.self, UserRecipe.self, configurations: bundleConfig)

            /// Make the document store equal to the bundle store. This removes all UserRecipe objects. Will add UserRecipes back in next step.
            documentContainer = bundleContainer

            for userRecipe in currentUserRecipes {
                /// Retrieve the Recipe that matches that of the UserRecipe.
                var descriptor = FetchDescriptor(predicate: #Predicate<Recipe> { $0.id == userRecipe.recipe.id })
                descriptor.fetchLimit = 1
                if let fetchedRecipe = try bundleContainer.mainContext.fetch(descriptor).first {
                    /// It exists. Create an updated UserRecipe to be added, and add it to the array.
                    let newUserRecipe = UserRecipe(recipe: fetchedRecipe, quantity: userRecipe.quantity)
                    documentContainer.mainContext.insert(newUserRecipe)
                }
            }

            /// Update the store name to check for updates in the future.
            SettingsManager.shared.currentStoreName = bundleStoreName
        }

        /// Now, return the container.
        return documentContainer
    } catch {
        fatalError("Failed to create model container: \(error.localizedDescription)")
    }
}()

/// The ModelContainer used for Xcode Previews.
@MainActor
let previewContainer: ModelContainer = {

    /// The name and extension of the database in the app bundle.
    let bundleStoreName = "xivhelper-2.3.0"
    let bundleStoreExtension = "store"

    do {
        /// Retrieve the prebuilt, read-only store from the app bundle.
        guard let bundleURL = Bundle.main.url(forResource: bundleStoreName, withExtension: bundleStoreExtension) else {
            fatalError("Failed to find \(bundleStoreName).\(bundleStoreExtension) in app bundle")
        }

        /// Return the read-only store.
        let config = ModelConfiguration(url: bundleURL, allowsSave: false)
        let container = try ModelContainer(
            for: Item.self, Recipe.self, UserRecipe.self,
            configurations: config
        )
        return container
    } catch {
        fatalError("Failed to create preview container: \(error)")
    }
}()
