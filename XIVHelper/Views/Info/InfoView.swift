import SwiftUI

/// Displays info about the app, as well as necessary credits, legal, and contact information.
struct InfoScreen: View {

    // MARK: Properties

    /// The shared settings manager instance.
    @ObservedObject var settings: SettingsManager = .shared

    // MARK: Body

    var body: some View {
        NavigationStack {
            List {
                // About text
                Section {
                    Text(AppStrings.Info.about)
                }
                Section {
                    // Credits
                    NavigationLink(destination: List {
                        Link(
                            AppStrings.Info.creditsXIVAPI,
                            destination: URL(string: AppStrings.Info.creditsXIVAPIURL)!
                        )
                        Link(
                            AppStrings.Info.creditsLodestoneNews,
                            destination: URL(string: AppStrings.Info.creditsLodestoneNewsURL)!
                        )
                        Link(
                            AppStrings.Info.creditsTeamcraft,
                            destination: URL(string: AppStrings.Info.creditsTeamcraftURL)!
                        )
                    }.navigationTitle("Credits")) {
                        Text("Credits")
                    }

                    // Legal info
                    NavigationLink(destination: List {
                        Text(AppStrings.Info.legal)
                    }.navigationTitle("Legal")) {
                        Text("Legal")
                    }

                    // Privacy policy
                    Link(destination: URL(string: AppStrings.Info.privacyPolicyURL)!) {
                        Text("Privacy Policy")
                    }
                }
                Text("Database version: \(SettingsManager.shared.currentStoreName)")
            }
            .listStyle(.insetGrouped)
            .navigationTitle(AppStrings.Navigation.info)
        }
    }
}

// MARK: Previews

#if DEBUG
#Preview {
    InfoScreen()
}
#endif
