import SwiftUI

/// Shows the app logo when launching the app.
struct SplashScreenView: View {

    // MARK: Properties

    /// Whether the app is active, following the splash screen's display.
    @State private var isActive: Bool = false

    /// The starting size of the splash screen.
    @State private var size: Double = 0.8

    /// The starting opacity of the splash screen.
    @State private var opacity: Double = 0

    // MARK: Body

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack(spacing: 16) {
                    Image(.splashScreenIcon)
                    Text(AppStrings.General.appName)
                        .font(.system(size: 48))
                        .foregroundStyle(.primary)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        size = 1.0
                        opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeIn(duration: 0.8)) {
                        isActive = true
                    }
                }
            }
        }
    }
}

// MARK: Previews

#if DEBUG
#Preview("Splash Screen") {
    SplashScreenView()
        .modelContainer(previewContainer)
}
#endif
