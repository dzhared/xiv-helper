import SwiftUI

@main
struct XIVHelperApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .dynamicTypeSize(.xSmall ... .accessibility2)
        }
        .modelContainer(appContainer)
    }
}
