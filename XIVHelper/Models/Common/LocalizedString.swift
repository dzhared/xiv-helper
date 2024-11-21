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
            return de ?? en
        case .fr:
            return fr ?? en
        case .ja:
            return ja ?? en
        default:
            return en
        }
    }

    // MARK: Private Properties

    /// The English string.
    let en: String

    /// The optional German string.
    let de: String?

    /// The optional French string.
    let fr: String?

    /// The optional Japanese string.
    let ja: String?

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

// MARK: Comparable

extension LocalizedString: Comparable {
    static func <(lhs: LocalizedString, rhs: LocalizedString) -> Bool {
        switch GameLocale.localeForDevice() {
        case .de:
            if let left = lhs.de, let right = rhs.de {
                return left < right
            }
        case .en:
            return lhs.en < rhs.en
        case .fr:
            if let left = lhs.fr, let right = rhs.fr {
                return left < right
            }
        case .ja:
            if let left = lhs.ja, let right = rhs.ja {
                return left < right
            }
        default:
            return lhs.en < rhs.en
        }

        // Default to comparing the English string.
        return lhs.en < rhs.en
    }
}
