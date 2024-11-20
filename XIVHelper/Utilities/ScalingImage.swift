import SwiftUI

/// An image used to scale with accessibility sizes.
struct ScalingImage: View {

    /// The current Dynamic Type size.
    @Environment(\.dynamicTypeSize) var size

    /// The image in the asset bundle.
    let image: Image

    /// The desired scale for the image.
    var scale: CGFloat {
        switch size {
        case .xSmall:
            return 0.8
        case .small:
            return 0.9
        case .medium:
            return 1
        case .large:
            return 1.1
        case .xLarge:
            return 1.2
        case .xxLarge:
            return 1.3
        case .xxxLarge:
            return 1.4
        case .accessibility1:
            return 1.5
        case .accessibility2:
            return 1.6
        case .accessibility3:
            return 1.7
        case .accessibility4:
            return 1.8
        case .accessibility5:
            return 1.9
        default:
            return 1
        }
    }

    // MARK: Body

    var body: some View {
        image
            .antialiased(true)
            .scaleEffect(scale)
    }

    // MARK: Initialization

    init(_ name: String) {
        self.image = Image(name)
    }

    init(_ resource: ImageResource) {
        self.image = Image(resource)
    }
}

// MARK: Previews

#if DEBUG
#Preview {
    ScalingImage(.HQ)
}
#endif
