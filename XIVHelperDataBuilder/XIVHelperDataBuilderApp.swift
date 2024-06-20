import SwiftUI
import SwiftData

@main
struct XIVHelperDataBuilderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Item.self, Recipe.self, UserRecipe.self])
    }
}
