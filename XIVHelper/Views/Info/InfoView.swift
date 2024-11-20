import SwiftUI
import UIKit

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
                    Link(
                        AppStrings.Info.emailMe,
                        destination: URL(string: AppStrings.Info.emailMeURL)!
                    )
                }
                Section {
                    // Credits
                    NavigationLink(destination: List {
                        Link(
                            AppStrings.Info.creditsLodestoneNews,
                            destination: URL(string: AppStrings.Info.creditsLodestoneNewsURL)!
                        )
                        Link(
                            AppStrings.Info.creditsTeamcraft,
                            destination: URL(string: AppStrings.Info.creditsTeamcraftURL)!
                        )
                    }.navigationTitle(AppStrings.Navigation.credits)) {
                        Text(AppStrings.Navigation.credits)
                    }

                    // Legal info
                    NavigationLink(destination: List {
                        Text(AppStrings.Info.legal)
                    }.navigationTitle(AppStrings.Navigation.legal)) {
                        Text(AppStrings.Navigation.legal)
                    }

                    // Privacy policy
                    Link(
                        AppStrings.Info.privacyPolicy,
                        destination: URL(string: AppStrings.Info.privacyPolicyURL)!
                    )
                }
                Text(String(format: AppStrings.Info.databaseVersion, settings.currentStoreName))
            }
            .listStyle(.insetGrouped)
            .navigationTitle(AppStrings.Navigation.about)
        }
    }
}

// MARK: Previews

#if DEBUG
#Preview {
    InfoScreen()
}
#endif
