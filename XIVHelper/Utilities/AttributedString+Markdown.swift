import Foundation

/// Mimics the String initializer for a localized string with arguments. Supports markdown.
extension AttributedString {
    public init(format: String, _ arguments: any CVarArg...) {
        let formattedString = String(format: format, arguments)
        self = try! AttributedString(markdown: formattedString)
    }
}
