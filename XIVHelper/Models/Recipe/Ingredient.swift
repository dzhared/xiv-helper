import Foundation

/// Used in a `Recipe` to determine how many of an item is needed. Does not initialize an entire
/// `Item` object for more responsive performance.
struct Ingredient: Codable, Equatable {

    // MARK: Properties

    /// The item ID of the ingredient.
    let id: Int

    /// The icon's URL, used for `AsyncImage`.
    let icon: URL

    /// The string version of the ingredient's item icon.
    private let ingredientItemIcon: String?

    /// The localized name of the ingredient's item.
    let name: LocalizedString

    /// The number needed.
    var quantity: Int

    // MARK: Initialization

    /// Initialize with partial URL.
    init(id: Int, ingredientItemIcon: String, name: LocalizedString, quantity: Int) {
        self.id = id
        self.icon = URL(string: "https://xivapi.com\(ingredientItemIcon)")!
        self.ingredientItemIcon = ingredientItemIcon
        self.name = name
        self.quantity = quantity
    }

    /// Initialize with full URL.
    init(id: Int, icon: URL, name: LocalizedString, quantity: Int) {
        self.id = id
        self.icon = icon
        self.ingredientItemIcon = nil
        self.name = name
        self.quantity = quantity
    }

    // MARK: Codable
    // Necessary to be able to decode `icon`

    enum CodingKeys: CodingKey {
        case id
        case icon
        case ingredientItemIcon
        case name
        case quantity
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ingredientItemIcon = try container.decodeIfPresent(String.self, forKey: .ingredientItemIcon)
        self.id = try container.decode(Int.self, forKey: .id)
        self.icon = URL(string: "https://xivapi.com\(ingredientItemIcon!)")!
        self.ingredientItemIcon = ingredientItemIcon
        self.name = try container.decode(LocalizedString.self, forKey: .name)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
    }
}
