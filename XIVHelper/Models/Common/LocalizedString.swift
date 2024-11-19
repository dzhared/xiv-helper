/// Possible item names, including plural versions, for an item.
struct LocalizedString: Codable, Equatable {

    // MARK: Properties

    /// The singular verison of the item name. If not available in a locale, default to the English
    /// plural form.
    var string: String {
        switch SettingsManager.shared.locale {
            case .en: return en
            case .ja: return ja ?? en
            case .de: return de ?? en
            case .fr: return fr ?? en
            case .ko: return ko ?? en
            case .zh: return zh ?? en
        }
    }

    // MARK: Private Properties

    /// The English string.
    let en: String

    /// The optional German string.
    private let de: String?

    /// The optional French string.
    private let fr: String?

    /// The optional Japanese string.
    private let ja: String?

    /// The optional Korean string.
    private let ko: String?

    /// The optional Chinese string.
    private let zh: String?

    // MARK: Initialization

    init(
        en: String,
        ja: String? = nil,
        de: String? = nil,
        fr: String? = nil,
        ko: String? = nil,
        zh: String? = nil
    ) {
        self.en = en
        self.ja = ja
        self.de = de
        self.fr = fr
        self.ko = ko
        self.zh = zh
    }

    // MARK: Example

    static let example = LocalizedString(en: "Gil", ja: "ギル", de: "Gil", fr: "Gil", ko: "길", zh: "金币")
}
