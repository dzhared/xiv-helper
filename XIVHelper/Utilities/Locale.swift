/// The available locales, primarily for name and description purposes.
enum Locale: String, LosslessStringConvertible {

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

    // MARK: Initialization

    init?(_ description: String) {
        self.init(rawValue: description)
    }

    var description: String {
        return self.rawValue
    }
}
