import Foundation

extension String {
    /// A method used to lowercase a string only in English or French. This avoids lowercasing nouns
    /// in German that should remain capitalized.
    ///
    /// - Returns: The string to be lowercased per locale.
    ///
    func lowercasedByLocale() -> String {
        // Check if the locale is English or French. If so, lowercase.
        let currentIdentifier = Locale.current.language.languageCode
        if currentIdentifier == "en" || currentIdentifier == "fr" {
            return self.lowercased()
        }
        // Otherwise, return as-is.
        return self
    }
}
