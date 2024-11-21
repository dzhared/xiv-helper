import Foundation

/// The available locales, primarily for name and description purposes.
enum GameLocale: String, LosslessStringConvertible {

    /// English locale.
    case en = "English"

    /// Japanese locale.
    case ja = "日本語"

    /// German locale.
    case de = "Deutsch"

    /// French locale.
    case fr = "Français"

    /// Korean locale.
    case ko = "한국어"

    /// Chinese locale.
    case zh = "中文"

    // MARK: Methods

    /// Returns the enum case for the current locale depending on the device locale.
    ///
    /// - Returns: The locale.
    ///
    static func localeForDevice() -> GameLocale {
        // The device's current locale identifier. Example: "en_US" or "ja_JP"
        let localeIdentifier = Locale.current.identifier

        // Use the two-letter language prefix of the identifier to determine which locale to use.
        if localeIdentifier.hasPrefix("de") {
            return .de
        } else if localeIdentifier.hasPrefix("en") {
            return .en
        } else if localeIdentifier.hasPrefix("fr") {
            return .fr
        } else if localeIdentifier.hasPrefix("ja") {
            return .ja
        }

        // TODO: Support Korean and Chinese in the future.

        // Default to English.
        return .en
    }

    // MARK: Initialization

    init?(_ description: String) {
        self.init(rawValue: description)
    }

    var description: String {
        return self.rawValue
    }
}
