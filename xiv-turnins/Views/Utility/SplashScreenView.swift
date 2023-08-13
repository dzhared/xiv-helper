import SwiftUI

// MARK: - SplashScreen

struct SplashScreen: View {
    
    // MARK: Properties
    
    /// Whether or not the main screen is active.
    @State private var isActive = false
    
    /// The current size of the logo.
    @State private var size = 0.8
    
    /// The current opacity of the logo.
    @State private var opacity = 0.5
    
    // MARK: Body
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack(spacing: 20) {
                    Image("XIVSplashScreenIcon")
                        .foregroundColor(.red)
                    Text("XIV Helper")
                        .font(Font.custom("Favorit", size: 45))
                        .foregroundColor(.primary.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
