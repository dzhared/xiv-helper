import SwiftUI
import CoreData

struct ContentView: View {

    /// The SwiftData model context.
    @Environment(\.modelContext) var context

    // MARK: Body

    var body: some View {
        VStack(spacing: 24) {
            // Decode all entries
            Button {
                decode()
            } label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Decode")
                }
                .frame(minWidth: 300)
                .padding()
            }

            // Save `store` files to desktop
            Button {
                saveFilesToDesktop()
            } label: {
                VStack {
                    Image(systemName: "desktopcomputer")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Save to Desktop")
                }
                .frame(minWidth: 300)
                .padding()
            }

            // Delete all entries
            Button {
                try? delete()
            } label: {
                VStack {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Delete")
                }
                .frame(minWidth: 300)
                .padding()
            }
        }
    }

    private func decode() {
        try? delete()

        // Decode items and insert into context
        let decodedItems: [Item] = Bundle.main.decode([Item].self, from: "item.json")
        let decodedRecipes: [Recipe] = Bundle.main.decode([Recipe].self, from: "recipe.json")

        // Map to dictionary for faster performance
        var itemDictionary = [Int: Item]()
        for item in decodedItems {
            itemDictionary[item.id] = item
            context.insert(item)
            print("Inserted item   \(item.id)")
        }

        print("Assigning resultItems...")
        for recipe in decodedRecipes {
            if let item = itemDictionary[recipe.resultId] {
                recipe.resultItem = item
                context.insert(recipe)
                print("Inserted recipe \(recipe.id) with item \(recipe.resultId)")
            } else {
                print("Skipping recipe \(recipe.id)")
            }
        }
        print("Assigned resultItems.")

        print("-- Results: --\nItems:   \(itemDictionary.count)\nRecipes: \(decodedRecipes.count)")

        try? context.save()
    }

    private func delete() throws {
        try context.delete(model: Item.self)
        try context.delete(model: Recipe.self)
        print("Delete successful")
    }

    private func saveFilesToDesktop() {
        let fileManager = FileManager.default
        let storeURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appendingPathComponent("default.store")
        let storeShmURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appendingPathComponent("default.store-shm")
        let storeWalURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appendingPathComponent("default.store-wal")

        let desktopURL = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let newStoreURL = desktopURL.appendingPathComponent("xivhelper.store")
        let newStoreShmURL = desktopURL.appendingPathComponent("xivhelper.store-shm")
        let newStoreWalURL = desktopURL.appendingPathComponent("xivhelper.store-wal")

        do {
            if fileManager.fileExists(atPath: storeURL.path) {
                try fileManager.copyItem(at: storeURL, to: newStoreURL)
            }
            if fileManager.fileExists(atPath: storeShmURL.path) {
                try fileManager.copyItem(at: storeShmURL, to: newStoreShmURL)
            }
            if fileManager.fileExists(atPath: storeWalURL.path) {
                try fileManager.copyItem(at: storeWalURL, to: newStoreWalURL)
            }
            print("Files copied to desktop successfully")
        } catch {
            print("Error copying files: \(error)")
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
