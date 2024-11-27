import Foundation
import SwiftData

/// Contains all necessary information about a recipe. Users will search these by its item name.
@Model class Recipe: Codable, Equatable {

    // MARK: Properties

    /// The unique ID of the recipe.
    private(set) var id: Int

    /// Whether the item can be High Quality.
    private(set) var canHq: Bool

    /// Whether the recipe can be Quick Synthesized.
    private(set) var canQs: Bool

    /// The Disciple of the Hand class ID for the recipe.
    private(set) var classJobId: Int

    /// The Disciple of the Hand `ClassJob` for the recipe.
    var classJob: ClassJob {
        ClassJob(id: classJobId)
    }

    /// The Disciple of the Hand level required to unlock the recipe.
    private(set) var classJobLevel: Int

    /// The Durability for crafting the recipe.
    private(set) var durability: Int

    /// Whether the recipe is an expert recipe.
    private(set) var expert: Bool

    /// The items and quantities needed to craft the recipe.
    private(set) var ingredients: [Ingredient]

    /// The item ID of the recipe's Master recipe book, if applicable.
    private(set) var masterbookId: Int?

    /// The item icon URL of the recipe's Master recipe book, if applicable.
    private(set) var masterbookItemIcon: String?

    /// The localized name of the recipe's Master recipe book, if applicable.
    private(set) var masterbookName: LocalizedString?

    /// The progress required for the recipe.
    private(set) var progress: Int

    /// The quality of the recipe.
    private(set) var quality: Int

    /// The rlvl of the recipe.
    private(set) var recipeLevel: Int

    /// The required Control stat for the recipe.
    private(set) var requiredControl: Int

    /// The required Craftsmanship stat for the recipe.
    private(set) var requiredCraftsmanship: Int

    /// The required Quality for the recipe. Very rarely used.
    private(set) var requiredQuality: Int

    /// The item ID of the resulting item.
    private(set) var resultId: Int

    /// The Item Level of the resulting item.
    private(set) var resultIlvl: Int

    /// The resulting item. Fetched using SwiftData upon initialization.
    var resultItem: Item?

    /// The ItemCategory ID of the resulting item.
    private(set) var resultItemCategory: Int

    /// The resulting item's icon URL. See below for implementation.
    private(set) var resultItemIcon: String

    /// The resulting item's localized name.
    private(set) var resultName: LocalizedString

    /// The resulting item's patch ID.
    private(set) var resultPatch: Int

    /// The number of Stars for the recipe, if any.
    private(set) var stars: Int

    /// The suggested Control stat for the recipe.
    /// NOTE: Always 0 as of Dawntrail update.
    private(set) var suggestedControl: Int

    /// The suggested Craftsmanship stat for the recipe.
    private(set) var suggestedCraftsmanship: Int

    /// The quantity of items yielded by the recipe.
    private(set) var yields: Int

    // MARK: Computed Properties

    /// The image URL of the resulting item.
    var icon: URL {
        URL(string: "https://xivapi.com\(resultItemIcon)")!
    }

    /// The image URL of the master recipe book item, if applicable.
    var masterbookIcon: URL? {
        if let masterbookItemIcon, let url = URL(string: "https://xivapi.com\(masterbookItemIcon)") {
            return url
        }
        return nil
    }

    // MARK: Codable

    enum CodingKeys: CodingKey {
        case id
        case canHq
        case canQs
        case classJobId
        case classJobLevel
        case durability
        case expert
        case ingredients
        case masterbookId
        case masterbookItemIcon
        case masterbookName
        case progress
        case quality
        case recipeLevel
        case requiredControl
        case requiredCraftsmanship
        case requiredQuality
        case resultId
        case resultIlvl
        case resultItem
        case resultItemCategory
        case resultItemIcon
        case resultName
        case resultPatch
        case stars
        case suggestedControl
        case suggestedCraftsmanship
        case yields
    }

    // MARK: Decodable

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.canHq = try container.decode(Bool.self, forKey: .canHq)
        self.canQs = try container.decode(Bool.self, forKey: .canQs)
        self.classJobId = try container.decode(Int.self, forKey: .classJobId)
        self.classJobLevel = try container.decode(Int.self, forKey: .classJobLevel)
        self.durability = try container.decode(Int.self, forKey: .durability)
        self.expert = try container.decode(Bool.self, forKey: .expert)
        self.ingredients = try container.decode([Ingredient].self, forKey: .ingredients)
        self.masterbookId = try container.decodeIfPresent(Int.self, forKey: .masterbookId)
        self.masterbookItemIcon = try container.decodeIfPresent(String.self, forKey: .masterbookItemIcon)
        self.masterbookName = try container.decodeIfPresent(LocalizedString.self, forKey: .masterbookName)
        self.progress = try container.decode(Int.self, forKey: .progress)
        self.quality = try container.decode(Int.self, forKey: .quality)
        self.recipeLevel = try container.decode(Int.self, forKey: .recipeLevel)
        self.requiredControl = try container.decode(Int.self, forKey: .requiredControl)
        self.requiredCraftsmanship = try container.decode(Int.self, forKey: .requiredCraftsmanship)
        self.requiredQuality = try container.decode(Int.self, forKey: .requiredQuality)
        self.resultId = try container.decode(Int.self, forKey: .resultId)
        self.resultIlvl = try container.decode(Int.self, forKey: .resultIlvl)
        self.resultItem = try container.decodeIfPresent(Item.self, forKey: .resultItem)
        self.resultItemCategory = try container.decode(Int.self, forKey: .resultItemCategory)
        self.resultItemIcon = try container.decode(String.self, forKey: .resultItemIcon)
        self.resultName = try container.decode(LocalizedString.self, forKey: .resultName)
        self.resultPatch = try container.decode(Int.self, forKey: .resultPatch)
        self.stars = try container.decode(Int.self, forKey: .stars)
        self.suggestedControl = try container.decode(Int.self, forKey: .suggestedControl)
        self.suggestedCraftsmanship = try container.decode(Int.self, forKey: .suggestedCraftsmanship)
        self.yields = try container.decode(Int.self, forKey: .yields)
    }

    // MARK: Encodable

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.canHq, forKey: .canHq)
        try container.encode(self.canQs, forKey: .canQs)
        try container.encode(self.classJobId, forKey: .classJobId)
        try container.encode(self.classJobLevel, forKey: .classJobLevel)
        try container.encode(self.durability, forKey: .durability)
        try container.encode(self.expert, forKey: .expert)
        try container.encode(self.ingredients, forKey: .ingredients)
        try container.encodeIfPresent(self.masterbookId, forKey: .masterbookId)
        try container.encodeIfPresent(self.masterbookItemIcon, forKey: .masterbookItemIcon)
        try container.encodeIfPresent(self.masterbookName, forKey: .masterbookName)
        try container.encode(self.progress, forKey: .progress)
        try container.encode(self.quality, forKey: .quality)
        try container.encode(self.recipeLevel, forKey: .recipeLevel)
        try container.encode(self.requiredControl, forKey: .requiredControl)
        try container.encode(self.requiredCraftsmanship, forKey: .requiredCraftsmanship)
        try container.encode(self.requiredQuality, forKey: .requiredQuality)
        try container.encode(self.resultId, forKey: .resultId)
        try container.encode(self.resultIlvl, forKey: .resultIlvl)
        try container.encodeIfPresent(self.resultItem, forKey: .resultItem)
        try container.encode(self.resultItemCategory, forKey: .resultItemCategory)
        try container.encode(self.resultItemIcon, forKey: .resultItemIcon)
        try container.encode(self.resultName, forKey: .resultName)
        try container.encode(self.resultPatch, forKey: .resultPatch)
        try container.encode(self.stars, forKey: .stars)
        try container.encode(self.suggestedControl, forKey: .suggestedControl)
        try container.encode(self.suggestedCraftsmanship, forKey: .suggestedCraftsmanship)
        try container.encode(self.yields, forKey: .yields)
    }

    /// Memberwise initializer. Used only for making the `.example` below.
    fileprivate init(id: Int, canHq: Bool, canQs: Bool, classJobId: Int, classJobLevel: Int, durability: Int, expert: Bool, ingredients: [Ingredient], masterbookId: Int?, masterbookItemIcon: String?, masterbookName: LocalizedString?, progress: Int, quality: Int, recipeLevel: Int, requiredControl: Int, requiredCraftsmanship: Int, requiredQuality: Int, resultId: Int, resultIlvl: Int, resultItem: Item? = nil, resultItemCategory: Int, resultItemIcon: String, resultName: LocalizedString, resultPatch: Int, stars: Int, suggestedControl: Int, suggestedCraftsmanship: Int, yields: Int) {
        self.id = id
        self.canHq = canHq
        self.canQs = canQs
        self.classJobId = classJobId
        self.classJobLevel = classJobLevel
        self.durability = durability
        self.expert = expert
        self.ingredients = ingredients
        self.masterbookId = masterbookId
        self.masterbookItemIcon = masterbookItemIcon
        self.masterbookName = masterbookName
        self.progress = progress
        self.quality = quality
        self.recipeLevel = recipeLevel
        self.requiredControl = requiredControl
        self.requiredCraftsmanship = requiredCraftsmanship
        self.requiredQuality = requiredQuality
        self.resultId = resultId
        self.resultIlvl = resultIlvl
        self.resultItem = resultItem
        self.resultItemCategory = resultItemCategory
        self.resultItemIcon = resultItemIcon
        self.resultName = resultName
        self.resultPatch = resultPatch
        self.stars = stars
        self.suggestedControl = suggestedControl
        self.suggestedCraftsmanship = suggestedCraftsmanship
        self.yields = yields
    }
}

// MARK: Example

#if DEBUG
extension Recipe {
    /// An example recipe for convenience.
    nonisolated(unsafe) static let example = Recipe(
        id: 3890,
        canHq: true,
        canQs: true,
        classJobId: 15,
        classJobLevel: 74,
        durability: 80,
        expert: false,
        ingredients: [
            Ingredient(
                id: 27841,
                ingredientItemIcon: "/i/025000/025351_hr1.png",
                name: LocalizedString(en: "Upland Wheat Flour", ja: "Test JA", de: "Test DE", fr: "Test FR"),
                quantity: 2
            ),
            Ingredient(id: 27968, ingredientItemIcon: "/i/022000/022678_hr1.png", name: LocalizedString(en: "Highland Spring Water", ja: "Test JA", de: "Test DE", fr: "Test FR"), quantity: 3),
            Ingredient(id: 19907, ingredientItemIcon: "/i/022000/022617_hr1.png", name: LocalizedString(en: "Ala Mhigan Salt Crystal", ja: "Test JA", de: "Test DE", fr: "Test FR"), quantity: 1),
            Ingredient(id: 8, ingredientItemIcon: "/i/020000/020007_hr1.png", name: LocalizedString(en: "Fire Crystal", ja: "Test JA", de: "Test DE", fr: "Test FR"), quantity: 7),
            Ingredient(id: 13, ingredientItemIcon: "/i/020000/020008_hr1.png", name: LocalizedString(en: "Water Crystal", ja: "Test JA", de: "Test DE", fr: "Test FR"), quantity: 6),
        ],
        masterbookId: 12244,
        masterbookItemIcon: "/i/026000/026156_hr1.png",
        masterbookName: LocalizedString(en: "Master Carpenter III", ja: "木工秘伝書:第3巻", de: "Der Meister-Zimmerer III", fr: "Menuiserie experte III"),
        progress: 1360,
        quality: 4000,
        recipeLevel: 403,
        requiredControl: 0,
        requiredCraftsmanship: 0,
        requiredQuality: 0,
        resultId: 27860,
        resultIlvl: 403,
        resultItemCategory: 46,
        resultItemIcon: "/i/024000/024030_hr1.png",
        resultName: LocalizedString(en: "Baguette", ja: "バゲット", de: "Baguette", fr: "Baguette tradition"),
        resultPatch: 58,
        stars: 0,
        suggestedControl: 1387,
        suggestedCraftsmanship: 1498,
        yields: 3
    )
}
#endif
