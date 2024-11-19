import SwiftUI
import SwiftData

// MARK: - SettingsManager

/// The current settings for the app.
final class SettingsManager: ObservableObject {

    // MARK: Initialization

    /// The shared instance of the settings manager.
    nonisolated(unsafe) static let shared = SettingsManager()

    /// Do not initialize the settings manager.
    private init() {}

    // MARK: Published Properties

    /// The currently selected tab of the main TabView.
    @Published var selectedTab: Int = 0

    // MARK: AppStorage Properties

    /// The available settings in AppStorage.
    enum Keys {
        enum Dawntrail: String, CaseIterable {
            case enabled
            case hasSeenWarning
        }
        enum Item: String, CaseIterable {
            case hq
        }
        enum General: String, CaseIterable {
            case currentStoreName
            case locale
        }
        enum User: String, CaseIterable {
            case userAscending
            // TODO: Store UserRecipes here?
            case userSortMethod
        }
        enum Search: String, CaseIterable {
            case searchAscending
            case searchCaseSensitive
            case searchEquipmentClass
            case searchEquipmentOnly
            case searchExpansion
            case searchHqOnly
            case searchResultsLimit
            case searchSortMethod
            case searchType

            enum Item: String, CaseIterable {
                case searchItemCraftableOnly
                case searchItemFilterByCategory
                case searchItemFilterCategory
                case searchItemTradableOnly
                case searchItemType
                case searchItemUniqueOnly
            }

            enum Recipe: String, CaseIterable {
                case searchRecipeClassJob
                case searchRecipeClassLevel
                case searchRecipeExpertOnly
                case searchRecipeLevel
                case searchRecipeMasterOnly
                case searchRecipeQsOnly
                case searchRecipeStars
            }
        }
        enum ShoppingList: String, CaseIterable {
            case baseMaterials
        }
    }

    // MARK: Item

    /// Whether to show the HQ version of items.
    @AppStorage(Keys.Item.hq.rawValue) var hq: Bool = true

    // MARK: General

    /// The language locale, defaulting to `en`.
    @AppStorage(Keys.General.locale.rawValue) var locale: Locale = .en

    /// The name of the current database store. Updated upon instantiating new database store.
    @AppStorage(Keys.General.currentStoreName.rawValue) var currentStoreName: String = "xivhelper-2.0.0"

    // MARK: User

    /// Whether the sort order is ascending.
    @AppStorage(Keys.User.userAscending.rawValue) var userAscending: Bool = true

    /// How to sort the User Recipes list.
    @AppStorage(Keys.User.userSortMethod.rawValue) var userSortMethod: SortMethod = .alphabetical

    // MARK: Search

    /// Whether the search results sort order is ascending.
    @AppStorage(Keys.Search.searchAscending.rawValue) var searchAscending: Bool = true

    /// Whether to search with case sensitivity.
    @AppStorage(Keys.Search.searchCaseSensitive.rawValue) var searchCaseSensitive: Bool = false

    /// Which equipment ClassJob to search for.
    @AppStorage(Keys.Search.searchEquipmentClass.rawValue) var searchEquipmentClass: AllClassJob = .all

    /// Whether the result is equippable.
    @AppStorage(Keys.Search.searchEquipmentOnly.rawValue) var searchEquipmentOnly: Bool = false

    /// Which expansions to search from.
    @AppStorage(Keys.Search.searchExpansion.rawValue) var searchExpansion: Expansion = .all

    /// Whether to search for items/recipes that can be HQ only.
    @AppStorage(Keys.Search.searchHqOnly.rawValue) var searchHqOnly: Bool = false

    /// The number of results to show.
    @AppStorage(Keys.Search.searchResultsLimit.rawValue) var searchResultsLimit: Int = 50

    /// How to sort the search results list.
    @AppStorage(Keys.Search.searchSortMethod.rawValue) var searchSortMethod: SortMethod = .alphabetical

    /// The type of object to search for.
    @AppStorage(Keys.Search.searchType.rawValue) var searchType: SearchType = .items

    // MARK: Items Search

    /// Whether to search for items that are craftable only.
    @AppStorage(Keys.Search.Item.searchItemCraftableOnly.rawValue) var searchItemCraftableOnly: Bool = false

    /// Whether to filter the item search by Search Category.
    @AppStorage(Keys.Search.Item.searchItemFilterByCategory.rawValue) var searchItemFilterByCategory: Bool = false

    /// Which SearchCategory to search for.
    @AppStorage(Keys.Search.Item.searchItemFilterCategory.rawValue) var searchItemFilterCategory: AllSearchCategory = .all

    /// Whether to search for tradable items only.
    @AppStorage(Keys.Search.Item.searchItemTradableOnly.rawValue) var searchItemTradableOnly: Bool = false

    /// Whether to search for unique items only.
    @AppStorage(Keys.Search.Item.searchItemUniqueOnly.rawValue) var searchItemUniqueOnly: Bool = false

    // MARK: Recipes Search

    /// Resets the Search settings to their defaults.
    func resetSearchSettings() {
        searchAscending = true
        searchCaseSensitive = false
        searchEquipmentClass = .all
        searchEquipmentOnly = false
        searchExpansion = .all
        searchHqOnly = false
        searchResultsLimit = 50
        searchSortMethod = .alphabetical
        searchType = .items

        searchItemCraftableOnly = false
        searchItemFilterByCategory = false
        searchItemFilterCategory = .all
        searchItemTradableOnly = false
        searchItemUniqueOnly = false
    }

    // MARK: Shopping List

    /// Whether to show base materials for the shopping list. For instance, if there are two Iron
    /// Ingots in the shopping list, this setting will instead replace those with the constituent
    /// ingredients needed for the two Iron Ingots.
    @AppStorage(Keys.ShoppingList.baseMaterials.rawValue) var baseMaterials: Bool = false
}

// MARK: - Enums

// MARK: SearchType

/// The available objects the user can search for.
enum SearchType: String, CaseIterable, LosslessStringConvertible {
    case gathering = "Gathering"
    case recipes = "Recipes"
    case items = "Items"

    init?(_ description: String) {
        self.init(rawValue: description)
    }

    var description: String {
        self.rawValue
    }
}

// MARK: SortMethod

/// The methods of sorting search results or items.
enum SortMethod: String, CaseIterable, LosslessStringConvertible {
    case alphabetical = "Alphabetical"
    case ilvl = "Item Level"
    case patch = "Patch"
    case rlvl = "Recipe Level"

    /// Initialize from a matching string value.
    init?(_ description: String) {
        self.init(rawValue: description)
    }

    /// The raw value for initialization.
    var description: String {
        self.rawValue
    }
}

// MARK: AllClassJob

/// All available ClassJobs, enumerated for settings purposes.
enum AllClassJob: String, CaseIterable, LosslessStringConvertible {

    /// Used to _not_ filter results.
    case all = "All"

    case gld = "GLD"
    case pgl = "PGL"
    case mrd = "MRD"
    case lnc = "LNC"
    case arc = "ARC"
    case cnj = "CNJ"
    case thm = "THM"
    case crp = "CRP"
    case bsm = "BSM"
    case arm = "ARM"
    case gsm = "GSM"
    case ltw = "LTW"
    case wvr = "WVR"
    case alc = "ALC"
    case cul = "CUL"
    case min = "MIN"
    case btn = "BTN"
    case fsh = "FSH"
    case pld = "PLD"
    case mnk = "MNK"
    case war = "WAR"
    case drg = "DRG"
    case brd = "BRD"
    case whm = "WHM"
    case blm = "BLM"
    case acn = "ACN"
    case smn = "SMN"
    case sch = "SCH"
    case rog = "ROG"
    case nin = "NIN"
    case mch = "MCH"
    case drk = "DRK"
    case ast = "AST"
    case sam = "SAM"
    case rdm = "RDM"
    case blu = "BLU"
    case gnb = "GNB"
    case dnc = "DNC"
    case rpr = "RPR"
    case sge = "SGE"
    case vpr = "VPR"
    case pct = "PCT"

    /// Initialize from a matching string value.
    init?(_ description: String) {
        self.init(rawValue: description)
    }

    /// The raw value for initialization.
    var description: String {
        self.rawValue
    }
}

// MARK: AllItemCategory

/// All available SearchCategory, enumerated for settings purposes.
enum AllSearchCategory: String, CaseIterable, LosslessStringConvertible {

    /// Used to _not_ filter results.
    case all = "All"

    case pugilistsArm = "Pugilist's Arm"
    case gladiatorsArm = "Gladiator's Arm"
    case maraudersArm = "Marauder's Arm"
    case archersArm = "Archer's Arm"
    case lancersArm = "Lancer's Arm"
    case oneHandedThaumaturgesArm = "One-handed Thaumaturge's Arm"
    case twoHandedThaumaturgesArm = "Two-handed Thaumaturge's Arm"
    case oneHandedConjurersArm = "One-handed Conjurer's Arm"
    case twoHandedConjurersArm = "Two-handed Conjurer's Arm"
    case arcanistsGrimoire = "Arcanist's Grimoire"
    case shield = "Shield"
    case carpentersPrimaryTool = "Carpenter's Primary Tool"
    case carpentersSecondaryTool = "Carpenter's Secondary Tool"
    case blacksmithsPrimaryTool = "Blacksmith's Primary Tool"
    case blacksmithsSecondaryTool = "Blacksmith's Secondary Tool"
    case armorersPrimaryTool = "Armorer's Primary Tool"
    case armorersSecondaryTool = "Armorer's Secondary Tool"
    case goldsmithsPrimaryTool = "Goldsmith's Primary Tool"
    case goldsmithsSecondaryTool = "Goldsmith's Secondary Tool"
    case leatherworkersPrimaryTool = "Leatherworker's Primary Tool"
    case leatherworkersSecondaryTool = "Leatherworker's Secondary Tool"
    case weaversPrimaryTool = "Weaver's Primary Tool"
    case weaversSecondaryTool = "Weaver's Secondary Tool"
    case alchemistsPrimaryTool = "Alchemist's Primary Tool"
    case alchemistsSecondaryTool = "Alchemist's Secondary Tool"
    case culinariansPrimaryTool = "Culinarian's Primary Tool"
    case culinariansSecondaryTool = "Culinarian's Secondary Tool"
    case minersPrimaryTool = "Miner's Primary Tool"
    case minersSecondaryTool = "Miner's Secondary Tool"
    case botanistsPrimaryTool = "Botanist's Primary Tool"
    case botanistsSecondaryTool = "Botanist's Secondary Tool"
    case fishersPrimaryTool = "Fisher's Primary Tool"
    case fishingTackle = "Fishing Tackle"
    case head = "Head"
    case body = "Body"
    case legs = "Legs"
    case hands = "Hands"
    case feet = "Feet"
    case unobtainable = "Unobtainable" // TODO: Remove? Filter out?
    case necklace = "Necklace"
    case earrings = "Earrings"
    case bracelets = "Bracelets"
    case ring = "Ring"
    case medicine = "Medicine"
    case ingredient = "Ingredient"
    case meal = "Meal"
    case seafood = "Seafood"
    case stone = "Stone"
    case metal = "Metal"
    case lumber = "Lumber"
    case cloth = "Cloth"
    case leather = "Leather"
    case bone = "Bone"
    case reagent = "Reagent"
    case dye = "Dye"
    case part = "Part"
    case furnishing = "Furnishing"
    case materia = "Materia"
    case crystal = "Crystal"
    case catalyst = "Catalyst"
    case miscellany = "Miscellany"
    case soulCrystal = "Soul Crystal"
    case other = "Other"
    case constructionPermit = "Construction Permit"
    case roof = "Roof"
    case exteriorWall = "Exterior Wall"
    case window = "Window"
    case door = "Door"
    case roofDecoration = "Roof Decoration"
    case exteriorWallDecoration = "Exterior Wall Decoration"
    case placard = "Placard"
    case fence = "Fence"
    case interiorWall = "Interior Wall"
    case flooring = "Flooring"
    case ceilingLight = "Ceiling Light"
    case outdoorFurnishing = "Outdoor Furnishing"
    case table = "Table"
    case tabletop = "Tabletop"
    case wallMounted = "Wall-mounted"
    case rug = "Rug"
    case minion = "Minion"
    case gardening = "Gardening"
    case demimateria = "Demimateria"
    case roguesArm = "Rogue's Arm"
    case seasonalMiscellany = "Seasonal Miscellany"
    case tripleTriadCard = "Triple Triad Card"
    case darkKnightsArm = "Dark Knight's Arm"
    case machinistsArm = "Machinist's Arm"
    case astrologiansArm = "Astrologian's Arm"
    case airshipHull = "Airship Hull"
    case airshipRigging = "Airship Rigging"
    case airshipAftcastle = "Airship Aftcastle"
    case airshipForecastle = "Airship Forecastle"
    case orchestrionRoll = "Orchestrion Roll"
    case painting = "Painting"
    case samuraisArm = "Samurai's Arm"
    case redMagesArm = "Red Mage's Arm"
    case scholarsArm = "Scholar's Arm"
    case fishersSecondaryTool = "Fisher's Secondary Tool"
    case currency = "Currency"
    case submersibleHull = "Submersible Hull"
    case submersibleStern = "Submersible Stern"
    case submersibleBow = "Submersible Bow"
    case submersibleBridge = "Submersible Bridge"
    case blueMagesArm = "Blue Mage's Arm"
    case gunbreakersArm = "Gunbreaker's Arm"
    case dancersArm = "Dancer's Arm"
    case reapersArm = "Reaper's Arm"
    case sagesArm = "Sage's Arm"

    /// Initialize from a matching string value.
    init?(_ description: String) {
        self.init(rawValue: description)
    }

    /// The raw value for initialization.
    var description: String {
        self.rawValue
    }
}

// MARK: Expansion

enum Expansion: String, CaseIterable, LosslessStringConvertible {
    case all = "All"
    case arr = "A Realm Reborn"     // id  0 - 18
    case hw = "Heavensward"         // id 19 - 35
    case sb = "Stormblood"          // id 36 - 57
    case shb = "Shadowbringers"     // id 58 - 76
    case ew = "Endwalker"           // id 77 - 94
    case dt = "Dawntrail"           // id 95+

    /// Initialize from a matching string value.
    init?(_ description: String) {
        self.init(rawValue: description)
    }

    /// The raw value for initialization.
    var description: String {
        self.rawValue
    }
}

// MARK: FetchDescriptor Builder
// TODO: This currently doesn't play nice with SwiftData. To be implemented in a future release.
/*
extension SettingsManager {
    static func itemFetchDescriptor(searchText: String) -> FetchDescriptor<Item> {

        /// The shared SettingsManager instance.
        let settings = SettingsManager.shared

        // MARK: Predicates

        // TODO: Add further options in a future version
        /// The predicates for filtering the search results.
        var predicates: [Predicate<Item>] = [
            #Predicate<Item> { $0.name.en.localizedStandardContains(searchText) }
        ]

        if settings.searchEquipmentOnly {
            predicates.append(#Predicate<Item> { $0.canBeEquipped })
        }

        /// Only include items that can be HQ.
        if settings.searchHqOnly {
            predicates.append(#Predicate<Item> { $0.canBeHq })
        }

        /// Only include items that can be crafted.
        if settings.searchItemCraftableOnly {
            predicates.append(#Predicate<Item> { $0.canBeCrafted })
        }

        /// Only include items that can be unique.
        if settings.searchItemUniqueOnly {
            predicates.append(#Predicate<Item> { $0.isUnique })
        }

        /// Only include items that are tradable.
        if settings.searchItemTradableOnly {
            predicates.append(#Predicate<Item> { !$0.isUntradable })
        }

        /// Only include items in the given expansion. `.all` does not filter.
        if settings.searchExpansion.rawValue == "all" {
            switch settings.searchExpansion {
            case .arr:
                predicates.append(#Predicate<Item> { Range(0...18).contains($0.patchId) })
            case .hw:
                predicates.append(#Predicate<Item> { Range(19...35).contains($0.patchId) })
            case .sb:
                predicates.append(#Predicate<Item> { Range(36...57).contains($0.patchId) })
            case .shb:
                predicates.append(#Predicate<Item> { Range(58...76).contains($0.patchId) })
            case .ew:
                predicates.append(#Predicate<Item> { Range(77...94).contains($0.patchId) })
            case .dt:
                predicates.append(#Predicate<Item> { $0.patchId > 94 })
            default:
                break
            }
        }

        /// Only include equipment that matches the given equipment class.
        if settings.searchEquipmentOnly, settings.searchEquipmentClass != .all {
            predicates.append(#Predicate<Item> {
                guard let classJobCategory = $0.classJobCategory else { return false }
                return classJobCategory.name.contains(settings.searchEquipmentClass.rawValue)
            })
        }

        let predicate = predicates.conjunction()

        // MARK: Sort Descriptors

        /// The descriptors for sorting the search results.
        var descriptors: [SortDescriptor<Item>] = []
        switch settings.searchSortMethod {
        case .alphabetical:
            descriptors.append(SortDescriptor(\Item.name.en, order: settings.searchAscending ? .forward : .reverse))
        case .ilvl:
            descriptors.append(SortDescriptor(\Item.ilvl, order: settings.searchAscending ? .forward : .reverse))
        case .patch:
            descriptors.append(SortDescriptor(\Item.patchId, order: settings.searchAscending ? .forward : .reverse))
        default:
            descriptors.append(SortDescriptor(\Item.name.en, order: settings.searchAscending ? .forward : .reverse))
        }

        // MARK: FetchDescriptor

        var fetchDescriptor = FetchDescriptor<Item>(
            predicate: predicate,
            sortBy: descriptors
        )
        fetchDescriptor.fetchLimit = settings.searchResultsLimit

        return fetchDescriptor
    }
}
END */
