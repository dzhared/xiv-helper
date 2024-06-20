import SwiftUI

/// Hosts the main views for the app in a TabView.
struct ContentView: View {

    // MARK: Properties

    /// The shared settings manager instance.
    @ObservedObject var settings = SettingsManager.shared

    // MARK: Body

    var body: some View {
        TabView(selection: $settings.selectedTab) {
            UserRecipeView()
                .tabItem { Label(AppStrings.TabView.recipes, systemImage: "list.clipboard") }
                .tag(0)
            SearchView()
                .tabItem { Label(AppStrings.TabView.search, systemImage: "magnifyingglass") }
                .tag(1)
            LodestoneNewsView()
                .tabItem { Label(AppStrings.TabView.news, systemImage: "newspaper") }
                .tag(2)
            InfoScreen()
                .tabItem { Label(AppStrings.TabView.info, systemImage: "info.circle") }
                .tag(3)
        }
    }
}
