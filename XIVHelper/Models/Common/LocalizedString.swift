import Foundation

/// Possible item names, including plural versions, for an item.
struct LocalizedString: Codable, Equatable {

    // MARK: Properties

    /// The localized item name as a string. If not available in a locale, default to English.
    var string: String {
        switch GameLocale.localeForDevice() {
        case .en:
            return en
        case .de:
            return de
        case .fr:
            return fr
        case .ja:
            return ja
        default:
            return en
        }
    }

    // MARK: Private Properties

    /// The English string.
    let en: String

    /// The German string.
    let de: String

    /// The French string.
    let fr: String

    /// The Japanese string.
    let ja: String

    /// The optional Korean string.
    private let ko: String?

    /// The optional Chinese string.
    private let zh: String?

    // MARK: Initialization

    init(
        en: String,
        ja: String,
        de: String,
        fr: String,
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

// MARK: Comparable

extension LocalizedString: Comparable {
    static func < (lhs: LocalizedString, rhs: LocalizedString) -> Bool {
        switch GameLocale.localeForDevice() {
        case .de:
            return lhs.de < rhs.de
        case .en:
            return lhs.en < rhs.en
        case .fr:
            return lhs.fr < rhs.fr
        case .ja:
            return lhs.ja < rhs.ja
        default:
            return lhs.en < rhs.en
        }
    }
}
