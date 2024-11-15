import Foundation
import SwiftData

@testable import XIV_Helper

@MainActor
let TestContainer: ModelContainer = {
    do {
        let bundleStoreName = "xivhelper-2.4.0"
        let bundleStoreExtension = "store"
        guard let bundleURL = Bundle.main.url(forResource: bundleStoreName, withExtension: bundleStoreExtension) else {
            fatalError("Failed to find \(bundleStoreName).\(bundleStoreExtension) in app bundle. Does it target XIVHelperTests?")
        }

        let config = ModelConfiguration(url: bundleURL, allowsSave: false)
        let container = try ModelContainer(for: Item.self, Recipe.self, UserRecipe.self, configurations: config)
        return container
    } catch {
        fatalError("Failed to create TestContainer: \(error)")
    }
}()
