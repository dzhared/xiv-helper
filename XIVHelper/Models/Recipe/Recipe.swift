import Foundation
import SwiftData

// TODO: Dawntrail
// Need to generate the new JSON and Store

// TODO: SwiftData
// Figure out migration schema

/// Contains all necessary information about a recipe. Users will search these by its item name.
@Model class Recipe: Codable, Identifiable {

    // MARK: Properties

    /// The unique ID of the recipe.
    let id: Int

    /// Whether the item can be High Quality.
    let canHq: Bool

    /// Whether the recipe can be Quick Synthesized.
    let canQs: Bool

    /// The Disciple of the Hand class ID for the recipe.
    private let classJobId: Int

    /// The Disciple of the Hand `ClassJob` for the recipe.
    var classJob: ClassJob {
        ClassJob(id: classJobId)
    }

    /// The Disciple of the Hand level required to unlock the recipe.
    let classJobLevel: Int

    /// The Durability for crafting the recipe.
    let durability: Int

    /// Whether the recipe is an expert recipe.
    let expert: Bool

    /// The items and quantities needed to craft the recipe.
    let ingredients: [Ingredient]

    /// The item ID of the recipe's Master recipe book, if applicable.
    let masterbookId: Int?

    /// The item icon URL of the recipe's Master recipe book, if applicable.
    private let masterbookItemIcon: String?

    /// The localized name of the recipe's Master recipe book, if applicable.
    let masterbookName: LocalizedString?

    /// The progress required for the recipe.
    let progress: Int

    /// The quality of the recipe.
    let quality: Int

    /// The rlvl of the recipe.
    let recipeLevel: Int

    /// The required Control stat for the recipe.
    let requiredControl: Int

    /// The required Craftsmanship stat for the recipe.
    let requiredCraftsmanship: Int

    /// The required Quality for the recipe. Very rarely used.
    let requiredQuality: Int

    /// The item ID of the resulting item.
    let resultId: Int

    /// The Item Level of the resulting item.
    let resultIlvl: Int

    /// The resulting item. Fetched using SwiftData upon initialization.
    var resultItem: Item?

    /// The ItemCategory ID of the resulting item.
    let resultItemCategory: Int

    /// The resulting item's icon URL. See below for implementation.
    private let resultItemIcon: String

    /// The resulting item's localized name.
    let resultName: LocalizedString

    /// The resulting item's patch ID.
    let resultPatch: Int

    /// The number of Stars for the recipe, if any.
    let stars: Int

    /// The suggested Control stat for the recipe.
    let suggestedControl: Int

    /// The suggested Craftsmanship stat for the recipe.
    let suggestedCraftsmanship: Int

    /// The quantity of items yielded by the recipe.
    let yields: Int

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
}
