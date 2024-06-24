import Foundation
import SwiftData

// TODO: Dawntrail
// Need to generate the new JSON and Store

// TODO: SwiftData
// Figure out migration schema

/// An item with relevant stats and information.
@Model class Item: Codable, Identifiable {

    // MARK: Properties

    /// The unique ID of the item.
    let id: Int

    /// The bonuses for a consumable item, such as food or potions.
    let bonuses: [Bonus]

    /// Whether the item can be created using crafting.
    var canBeCrafted: Bool

    /// Whether the item can be equipped.
    let canBeEquipped: Bool

    /// Whether the item can be gathered.
    let canBeGathered: Bool

    /// Whether the item can be High Quality.
    let canBeHq: Bool

    /// The `ClassJobCategory` for the item, if applicable.
    var classJobCategory: ClassJobCategory? {
        if let classJobCategoryId {
            return ClassJobCategory(id: classJobCategoryId)
        }
        return nil
    }

    /// The ID of the ClassJobCategory. Can be used to return an array of ClassJob objects.
    private let classJobCategoryId: Int?

    /// The localized description of the item. Name truncated as `description` is reserved in Swift.
    let desc: LocalizedString

    /// The Class Job level required to equip the item, if equippable.
    let equipLevel: Int?

    /// The EquipSlotCategory ID for the item, if equippable.
    let equipSlotCategory: Int?

    /// The number of Grand Company seals rewarded for expert delivery. This is NOT the same as the
    /// daily supply/provisioning missions. See `supply` for details on those.
    let gcReward: Int?

    /// The icon's ID, used to construct the image URL. See `iconUrl` below for actual implementation.
    private let icon: String

    /// The iLvl of the item.
    let ilvl: Int?

    /// For fish, the illustration shown in fishing log. See `ingameDrawingUrl` below for implementation.
    private let ingameDrawing: String?

    /// Whether the item is a fish.
    let isFish: Bool

    /// Whether the item is tradable. Use `isUntradable` in practice, as the game denotes items as
    /// untradable rather than tradable.
    private let isTradable: Bool

    /// Whether the item is unique, such as dungeon armor.
    let isUnique: Bool

    /// The ID of the item's category, such as `40` for necklaces.
    let itemCategory: Int

    /// The leves that the item can be turned in for.
    let leves: [Leve]

    /// The localized name of the item.
    let name: LocalizedString

    /// The nodes from which the item can be gathered.
    let nodes: [Node]

    /// The ID of the patch that added the item. Default is `0`, initial release.
    let patchId: Int

    /// The price in gil for the item, if available in NPC shops.
    let price: Int?

    /// The ID of the item's rarity.
    let rarity: Int

    /// Simplified information about the recipes to make the item, if available. Default `[]`.
    let recipes: [ItemRecipe]

    /// The ID of the class that can repair the item, if applicable.
    let repair: Int?

    /// The search category for the item. Default is `8` for "Other".
    let searchCategory: Int

    /// The value in gil, if able to sell to NPC shops or retainer.
    let sellPrice: Int?

    /// The number of materia slots. Default is 0.
    let sockets: Int

    /// The item's main stats (e.g., Block and Block rate, or Defense and Magic Defense). Default is empty array.
    let statsMain: [Stat]

    /// The item's secondary stats (e.g., Vitality, Mind, Piety). Default is empty array.
    let statsSecondary: [Stat]

    /// The Grand Company supply mission rewards, if applicable.
    let supply: Supply?

    /// The icon's URL, used for AsyncImage.
    var iconUrl: URL {
        let urlString = "https://xivapi.com\(icon)"
        return URL(string: urlString)!
    }

    /// The in-game drawing's optional URL, used for AsyncImage. Primarily for fish.
    var ingameDrawingUrl: URL? {
        if let ingameDrawing, let url = URL(string: "https://xivapi.com\(ingameDrawing)") {
            return url
        }
        return nil
    }

    /// Whether an item is _not_ tradable. The game's UI calls out untradable items, rather than
    /// tradable ones, so this property is for convenience and clarity.
    var isUntradable: Bool {
        !isTradable
    }

    /// The patch the item was added in.
    var patch: Patch {
        Patch(id: patchId)
    }

    // MARK: Initialization

    init(
        id: Int,
        name: LocalizedString,
        bonuses: [Bonus],
        canBeCrafted: Bool,
        canBeEquipped: Bool,
        canBeGathered: Bool,
        canBeHq: Bool,
        classJobCategoryId: Int?,
        desc: LocalizedString,
        equipLevel: Int?,
        equipSlotCategory: Int?,
        gcReward: Int?,
        icon: String,
        ilvl: Int?,
        ingameDrawing: String?,
        isFish: Bool,
        isTradable: Bool,
        isUnique: Bool,
        itemCategory: Int,
        leves: [Leve],
        nodes: [Node],
        patchId: Int,
        price: Int?,
        rarity: Int,
        recipes: [ItemRecipe],
        repair: Int?,
        searchCategory: Int,
        sellPrice: Int?,
        sockets: Int,
        statsMain: [Stat],
        statsSecondary: [Stat],
        supply: Supply?
    ) {
        self.id = id
        self.name = name
        self.bonuses = bonuses
        self.canBeCrafted = canBeCrafted
        self.canBeEquipped = canBeEquipped
        self.canBeGathered = canBeGathered
        self.canBeHq = canBeHq
        self.classJobCategoryId = classJobCategoryId
        self.desc = desc
        self.equipLevel = equipLevel
        self.equipSlotCategory = equipSlotCategory
        self.gcReward = gcReward
        self.icon = icon
        self.ilvl = ilvl
        self.ingameDrawing = ingameDrawing
        self.isFish = isFish
        self.isTradable = isTradable
        self.isUnique = isUnique
        self.itemCategory = itemCategory
        self.leves = leves
        self.nodes = nodes
        self.patchId = patchId
        self.price = price
        self.rarity = rarity
        self.recipes = recipes
        self.repair = repair
        self.searchCategory = searchCategory
        self.sellPrice = sellPrice
        self.sockets = sockets
        self.statsMain = statsMain
        self.statsSecondary = statsSecondary
        self.supply = supply
    }

    // MARK: Codable

    enum CodingKeys: CodingKey {
        case id
        case name
        case bonuses
        case canBeCrafted
        case canBeEquipped
        case canBeGathered
        case canBeHq
        case classJobCategoryId
        case desc
        case equipLevel
        case equipSlotCategory
        case gcReward
        case icon
        case ilvl
        case ingameDrawing
        case isFish
        case isTradable
        case isUnique
        case itemCategory
        case leves
        case nodes
        case patchId
        case price
        case rarity
        case recipes
        case repair
        case searchCategory
        case sellPrice
        case sockets
        case statsMain
        case statsSecondary
        case supply
    }

    // MARK: Decodable

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(LocalizedString.self, forKey: .name)
        self.bonuses = try container.decode([Bonus].self, forKey: .bonuses)
        self.canBeCrafted = try container.decode(Bool.self, forKey: .canBeCrafted)
        self.canBeEquipped = try container.decode(Bool.self, forKey: .canBeEquipped)
        self.canBeGathered = try container.decode(Bool.self, forKey: .canBeGathered)
        self.canBeHq = try container.decode(Bool.self, forKey: .canBeHq)
        self.classJobCategoryId = try container.decodeIfPresent(Int.self, forKey: .classJobCategoryId)
        self.desc = try container.decode(LocalizedString.self, forKey: .desc)
        self.equipLevel = try container.decodeIfPresent(Int.self, forKey: .equipLevel)
        self.equipSlotCategory = try container.decodeIfPresent(Int.self, forKey: .equipSlotCategory)
        self.gcReward = try container.decodeIfPresent(Int.self, forKey: .gcReward)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.ilvl = try container.decodeIfPresent(Int.self, forKey: .ilvl)
        self.ingameDrawing = try container.decodeIfPresent(String.self, forKey: .ingameDrawing)
        self.isFish = try container.decode(Bool.self, forKey: .isFish)
        self.isTradable = try container.decode(Bool.self, forKey: .isTradable)
        self.isUnique = try container.decode(Bool.self, forKey: .isUnique)
        self.itemCategory = try container.decode(Int.self, forKey: .itemCategory)
        self.leves = try container.decode([Leve].self, forKey: .leves)
        self.nodes = try container.decode([Node].self, forKey: .nodes)
        self.patchId = try container.decode(Int.self, forKey: .patchId)
        self.price = try container.decodeIfPresent(Int.self, forKey: .price)
        self.rarity = try container.decode(Int.self, forKey: .rarity)
        self.recipes = try container.decode([ItemRecipe].self, forKey: .recipes)
        self.repair = try container.decodeIfPresent(Int.self, forKey: .repair)
        self.searchCategory = try container.decode(Int.self, forKey: .searchCategory)
        self.sellPrice = try container.decodeIfPresent(Int.self, forKey: .sellPrice)
        self.sockets = try container.decode(Int.self, forKey: .sockets)
        self.statsMain = try container.decode([Stat].self, forKey: .statsMain)
        self.statsSecondary = try container.decode([Stat].self, forKey: .statsSecondary)
        self.supply = try container.decodeIfPresent(Supply.self, forKey: .supply)
    }

    // MARK: Encodable

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.bonuses, forKey: .bonuses)
        try container.encode(self.canBeCrafted, forKey: .canBeCrafted)
        try container.encode(self.canBeEquipped, forKey: .canBeEquipped)
        try container.encode(self.canBeGathered, forKey: .canBeGathered)
        try container.encode(self.canBeHq, forKey: .canBeHq)
        try container.encodeIfPresent(self.classJobCategoryId, forKey: .classJobCategoryId)
        try container.encode(self.desc, forKey: .desc)
        try container.encodeIfPresent(self.equipLevel, forKey: .equipLevel)
        try container.encodeIfPresent(self.equipSlotCategory, forKey: .equipSlotCategory)
        try container.encodeIfPresent(self.gcReward, forKey: .gcReward)
        try container.encode(self.icon, forKey: .icon)
        try container.encodeIfPresent(self.ilvl, forKey: .ilvl)
        try container.encodeIfPresent(self.ingameDrawing, forKey: .ingameDrawing)
        try container.encode(self.isFish, forKey: .isFish)
        try container.encode(self.isTradable, forKey: .isTradable)
        try container.encode(self.isUnique, forKey: .isUnique)
        try container.encode(self.itemCategory, forKey: .itemCategory)
        try container.encode(self.leves, forKey: .leves)
        try container.encode(self.nodes, forKey: .nodes)
        try container.encode(self.patchId, forKey: .patchId)
        try container.encodeIfPresent(self.price, forKey: .price)
        try container.encode(self.rarity, forKey: .rarity)
        try container.encode(self.recipes, forKey: .recipes)
        try container.encodeIfPresent(self.repair, forKey: .repair)
        try container.encode(self.searchCategory, forKey: .searchCategory)
        try container.encodeIfPresent(self.sellPrice, forKey: .sellPrice)
        try container.encode(self.sockets, forKey: .sockets)
        try container.encode(self.statsMain, forKey: .statsMain)
        try container.encode(self.statsSecondary, forKey: .statsSecondary)
        try container.encodeIfPresent(self.supply, forKey: .supply)
    }
}
