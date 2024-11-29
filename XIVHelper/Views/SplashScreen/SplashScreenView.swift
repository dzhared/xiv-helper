import SwiftUI

/// Shows the app logo when launching the app.
struct SplashScreenView: View {

    // MARK: Properties

    /// Whether the app is active, following the splash screen's display.
    @State private var backgroundOpacity: Double = 1

    /// The current color scheme, used to determine what color to show for the background.
    @Environment(\.colorScheme) var colorScheme

    /// The starting opacity of the splash screen.
    @State private var logoOpacity: Double = 0

    /// Whether the splash screen exists. Used to deinitialize after finished.
    @State private var showSplashScreen: Bool = true

    // MARK: Body

    var body: some View {
        ZStack {
            ContentView()
            if showSplashScreen {
                splashScreen()
            }
        }
    }

    // MARK: View Builder

    /// The splash screen.
    @ViewBuilder private func splashScreen() -> some View {
        // Color background
        Color.init(colorScheme == .dark ? .black : .white)
            .opacity(backgroundOpacity)
            .ignoresSafeArea()

        // Logo
        VStack(spacing: 16) {
            Image(.splashScreenIcon)
            Text(AppStrings.General.appName)
                .font(.system(size: 48))
                .foregroundStyle(.primary)
        }
        .opacity(logoOpacity)
        .onAppear {
            Task { @MainActor in
                await animateSplashScreen()
            }
        }
    }

    // MARK: Private Methods

    /// The loop responsible for the entire splash screen animation.
    @MainActor private func animateSplashScreen() async {
        // Fade in the logo
        try? await Task.sleep(seconds: 0.5)
        withAnimation(.easeInOut(duration: 0.5)) {
            logoOpacity = 1.0
        }

        // Fade the splash screen out
        try? await Task.sleep(seconds: 2)
        withAnimation(.linear(duration: 0.5)) {
            backgroundOpacity = 0
            logoOpacity = 0
        }

        // Deinitialize the splash screen after completed
        try? await Task.sleep(seconds: 2.5)
        showSplashScreen = false
    }
}

// MARK: Previews

#if DEBUG
#Preview("Splash Screen") {
    SplashScreenView()
        .modelContainer(previewContainer)
}
#endif
