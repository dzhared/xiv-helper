import Foundation

// TODO: Dawntrail
// Probably only need to add Pictomanger's Arm and Viper's Arm, but verify

// TODO: Filter out Belts (id 39)

/// The name of a category of item.
struct ItemCategory: Codable {

    // MARK: Properties

    /// The localized name of the item category.
    let name: LocalizedString

    // MARK: Initialization

    /// Memberwise initializer, left private.
    private init(name: LocalizedString) {
        self.name = name
    }

    /// Initialize using only the ID.
    init(id: Int) {
        self.name = ItemCategory.getItemCategoryNameFromId(id)
    }

    // MARK: Private Methods

    /// Returns a `LocalizedString` from a given ID.
    private static func getItemCategoryNameFromId(_ id: Int) -> LocalizedString {
        switch id {
        case 1: return LocalizedString(en: "Pugilist's Arm", ja: "格闘武器", de: "Hauptwaffe der Faustkämpfer", fr: "Arme de pugiliste")
        case 2: return LocalizedString(en: "Gladiator's Arm", ja: "片手剣", de: "Hauptwaffe der Gladiatoren", fr: "Arme de gladiateur")
        case 3: return LocalizedString(en: "Marauder's Arm", ja: "両手斧", de: "Hauptwaffe der Marodeure", fr: "Arme de maraudeur")
        case 4: return LocalizedString(en: "Archer's Arm", ja: "弓", de: "Hauptwaffe der Waldläufer", fr: "Arme d'archer")
        case 5: return LocalizedString(en: "Lancer's Arm", ja: "両手槍", de: "Hauptwaffe der Pikeniere", fr: "Arme d'hast")
        case 6: return LocalizedString(en: "One-handed Thaumaturge's Arm", ja: "片手呪具", de: "Thaumaturgen-Waffe", fr: "Arme d'occultiste")
        case 7: return LocalizedString(en: "Two-handed Thaumaturge's Arm", ja: "両手呪具", de: "Thaumaturgen-Zweihandwaffe", fr: "Arme à deux mains d'occultiste")
        case 8: return LocalizedString(en: "One-handed Conjurer's Arm", ja: "片手幻具", de: "Druiden-Waffe", fr: "Arme d'élémentaliste")
        case 9: return LocalizedString(en: "Two-handed Conjurer's Arm", ja: "両手幻具", de: "Druiden-Zweihandwaffe", fr: "Arme à deux mains d'élémentaliste")
        case 10: return LocalizedString(en: "Arcanist's Grimoire", ja: "魔道書", de: "Grimoire", fr: "Arme d'arcaniste")
        case 11: return LocalizedString(en: "Shield", ja: "盾", de: "Schild", fr: "Bouclier")
        case 12: return LocalizedString(en: "Carpenter's Primary Tool", ja: "木工道具(主道具)", de: "Zimmermannszeug", fr: "Outil principal de menuisier")
        case 13: return LocalizedString(en: "Carpenter's Secondary Tool", ja: "木工道具(副道具)", de: "Zimmermannszeug (sekundär)", fr: "Outil secondaire de menuisier")
        case 14: return LocalizedString(en: "Blacksmith's Primary Tool", ja: "鍛冶道具(主道具)", de: "Schmiedezeug", fr: "Outil principal de forgeron")
        case 15: return LocalizedString(en: "Blacksmith's Secondary Tool", ja: "鍛冶道具(副道具)", de: "Schmiedezeug (sekundär)", fr: "Outil secondaire de forgeron")
        case 16: return LocalizedString(en: "Armorer's Primary Tool", ja: "甲冑道具(主道具)", de: "Plattnerzeug", fr: "Outil principal d'armurier")
        case 17: return LocalizedString(en: "Armorer's Secondary Tool", ja: "甲冑道具(副道具)", de: "Plattnerzeug (sekundär)", fr: "Outil secondaire d'armurier")
        case 18: return LocalizedString(en: "Goldsmith's Primary Tool", ja: "彫金道具(主道具)", de: "Goldschmiedezeug", fr: "Outil principal d'orfèvre")
        case 19: return LocalizedString(en: "Goldsmith's Secondary Tool", ja: "彫金道具(副道具)", de: "Goldschmiedezeug (sekundär)", fr: "Outil secondaire d'orfèvre")
        case 20: return LocalizedString(en: "Leatherworker's Primary Tool", ja: "革細工道具(主道具)", de: "Gerberzeug", fr: "Outil principal de tanneur")
        case 21: return LocalizedString(en: "Leatherworker's Secondary Tool", ja: "革細工道具(副道具)", de: "Gerberzeug (sekundär)", fr: "Outil secondaire de tanneur")
        case 22: return LocalizedString(en: "Weaver's Primary Tool", ja: "裁縫道具(主道具)", de: "Weberzeug", fr: "Outil principal de couturier")
        case 23: return LocalizedString(en: "Weaver's Secondary Tool", ja: "裁縫道具(副道具)", de: "Weberzeug (sekundär)", fr: "Outil secondaire de couturier")
        case 24: return LocalizedString(en: "Alchemist's Primary Tool", ja: "錬金道具(主道具)", de: "Alchemistenzeug", fr: "Outil principal d'alchimiste")
        case 25: return LocalizedString(en: "Alchemist's Secondary Tool", ja: "錬金道具(副道具)", de: "Alchemistenzeug (sekundär)", fr: "Outil secondaire d'alchimiste")
        case 26: return LocalizedString(en: "Culinarian's Primary Tool", ja: "調理道具(主道具)", de: "Gourmetzeug", fr: "Outil principal de cuisinier")
        case 27: return LocalizedString(en: "Culinarian's Secondary Tool", ja: "調理道具(副道具)", de: "Gourmetzeug (sekundär)", fr: "Outil secondaire de cuisinier")
        case 28: return LocalizedString(en: "Miner's Primary Tool", ja: "採掘道具(主道具)", de: "Minenarbeiterzeug", fr: "Outil principal de mineur")
        case 29: return LocalizedString(en: "Miner's Secondary Tool", ja: "採掘道具(副道具)", de: "Minenarbeiterzeug (sekundär)", fr: "Outil secondaire de mineur")
        case 30: return LocalizedString(en: "Botanist's Primary Tool", ja: "園芸道具(主道具)", de: "Gärtnerzeug", fr: "Outil principal de botaniste")
        case 31: return LocalizedString(en: "Botanist's Secondary Tool", ja: "園芸道具(副道具)", de: "Gärtnerzeug (sekundär)", fr: "Outil secondaire de botaniste")
        case 32: return LocalizedString(en: "Fisher's Primary Tool", ja: "漁道具(主道具)", de: "Fischerzeug", fr: "Outil principal de pêcheur")
        case 33: return LocalizedString(en: "Fishing Tackle", ja: "釣り餌", de: "Angelköder", fr: "Appât de pêche")
        case 34: return LocalizedString(en: "Head", ja: "頭防具", de: "Kopf", fr: "Tête")
        case 35: return LocalizedString(en: "Body", ja: "胴防具", de: "Rumpf", fr: "Torse")
        case 36: return LocalizedString(en: "Legs", ja: "脚防具", de: "Beine", fr: "Jambes")
        case 37: return LocalizedString(en: "Hands", ja: "手防具", de: "Hände", fr: "Mains")
        case 38: return LocalizedString(en: "Feet", ja: "足防具", de: "Füße", fr: "Pieds")
        case 39: return LocalizedString(en: "Unobtainable", ja: "排出停止アイテム", de: "Eingestellte Gegenstände", fr: "Objet désuet")
        case 40: return LocalizedString(en: "Necklace", ja: "首飾り", de: "Halskette", fr: "Collier")
        case 41: return LocalizedString(en: "Earrings", ja: "耳飾り", de: "Ohrring", fr: "Boucle d'oreille")
        case 42: return LocalizedString(en: "Bracelets", ja: "腕輪", de: "Armreif", fr: "Bracelet")
        case 43: return LocalizedString(en: "Ring", ja: "指輪", de: "Ring", fr: "Bague")
        case 44: return LocalizedString(en: "Medicine", ja: "薬品", de: "Arznei", fr: "Médicament")
        case 45: return LocalizedString(en: "Ingredient", ja: "食材", de: "Zutat", fr: "Ingrédient")
        case 46: return LocalizedString(en: "Meal", ja: "調理品", de: "Gericht", fr: "Plat ou boisson")
        case 47: return LocalizedString(en: "Seafood", ja: "水産物", de: "Meeresfrüchte", fr: "Produit de la pêche")
        case 48: return LocalizedString(en: "Stone", ja: "石材", de: "Baustein", fr: "Pierre")
        case 49: return LocalizedString(en: "Metal", ja: "金属材", de: "Metall", fr: "Métal")
        case 50: return LocalizedString(en: "Lumber", ja: "木材", de: "Nutzholz", fr: "Bois")
        case 51: return LocalizedString(en: "Cloth", ja: "布材", de: "Stoff", fr: "Tissu")
        case 52: return LocalizedString(en: "Leather", ja: "皮革材", de: "Leder", fr: "Cuir")
        case 53: return LocalizedString(en: "Bone", ja: "骨材", de: "Knochen/Horn", fr: "Os")
        case 54: return LocalizedString(en: "Reagent", ja: "錬金術材", de: "Reagenz", fr: "Réactif")
        case 55: return LocalizedString(en: "Dye", ja: "染料", de: "Farbstoff", fr: "Teinture")
        case 56: return LocalizedString(en: "Part", ja: "部品", de: "Einzelteil", fr: "Composant")
        case 57: return LocalizedString(en: "Furnishing", ja: "調度品", de: "Mobiliar", fr: "Meuble")
        case 58: return LocalizedString(en: "Materia", ja: "マテリア", de: "Materia", fr: "Matéria")
        case 59: return LocalizedString(en: "Crystal", ja: "クリスタル", de: "Kristall", fr: "Cristal")
        case 60: return LocalizedString(en: "Catalyst", ja: "触媒", de: "Katalysator", fr: "Catalyseur")
        case 61: return LocalizedString(en: "Miscellany", ja: "雑貨", de: "Verschiedenes", fr: "Divers")
        case 62: return LocalizedString(en: "Soul Crystal", ja: "ソウルクリスタル", de: "Jobkristall", fr: "Cristal d'âme")
        case 63: return LocalizedString(en: "Other", ja: "その他", de: "Anderes", fr: "Autre")
        case 64: return LocalizedString(en: "Construction Permit", ja: "建築物権利証書", de: "Baugenehmigung", fr: "Titre immobilier")
        case 65: return LocalizedString(en: "Roof", ja: "外装建材(屋根)", de: "Dach", fr: "Toit")
        case 66: return LocalizedString(en: "Exterior Wall", ja: "外装建材(外壁)", de: "Mauer", fr: "Élément de façade")
        case 67: return LocalizedString(en: "Window", ja: "外装建材(窓)", de: "Fenster", fr: "Fenêtre")
        case 68: return LocalizedString(en: "Door", ja: "外装建材(扉)", de: "Tür", fr: "Porte")
        case 69: return LocalizedString(en: "Roof Decoration", ja: "外装建材(屋根装飾)", de: "Dachdekoration", fr: "Décoration de toit")
        case 70: return LocalizedString(en: "Exterior Wall Decoration", ja: "外装建材(外壁装飾)", de: "Fassadendekoration", fr: "Décoration de façade")
        case 71: return LocalizedString(en: "Placard", ja: "外装建材(看板)", de: "Tafel", fr: "Panneau")
        case 72: return LocalizedString(en: "Fence", ja: "外装建材(塀)", de: "Zaun", fr: "Muret")
        case 73: return LocalizedString(en: "Interior Wall", ja: "内装建材(内壁)", de: "Innenwand", fr: "Tapisserie")
        case 74: return LocalizedString(en: "Flooring", ja: "内装建材(床)", de: "Boden", fr: "Sol")
        case 75: return LocalizedString(en: "Ceiling Light", ja: "内装建材(天井照明)", de: "Deckenleuchte", fr: "Luminaire")
        case 76: return LocalizedString(en: "Outdoor Furnishing", ja: "庭具", de: "Gartenausstattung", fr: "Meuble de jardin")
        case 77: return LocalizedString(en: "Table", ja: "調度品(台座)", de: "Tisch/Ablage", fr: "Table")
        case 78: return LocalizedString(en: "Tabletop", ja: "調度品(卓上)", de: "Tischdekoration", fr: "Mobilier de table")
        case 79: return LocalizedString(en: "Wall-mounted", ja: "調度品(壁掛)", de: "Wanddekoration", fr: "Mobilier mural")
        case 80: return LocalizedString(en: "Rug", ja: "調度品(敷物)", de: "Teppich", fr: "Tapis")
        case 81: return LocalizedString(en: "Minion", ja: "ミニオン", de: "Begleiter", fr: "Mascotte")
        case 82: return LocalizedString(en: "Gardening", ja: "栽培用品", de: "Gartenbau", fr: "Jardinage")
        case 83: return LocalizedString(en: "Demimateria", ja: "デミマテリア", de: "Demimateria", fr: "Demi-matéria")
        case 84: return LocalizedString(en: "Rogue's Arm", ja: "双剣", de: "Hauptwaffe der Schurken", fr: "Arme de surineur")
        case 85: return LocalizedString(en: "Seasonal Miscellany", ja: "雑貨(シーズナル)", de: "Saisonaler Gegenstand", fr: "Divers (événements)")
        case 86: return LocalizedString(en: "Triple Triad Card", ja: "トリプルトライアドカード", de: "Triple Triad-Karte", fr: "Carte de Triple Triade")
        case 87: return LocalizedString(en: "Dark Knight's Arm", ja: "両手剣", de: "Hauptwaffe der Dunkelritter", fr: "Arme de chevalier noir")
        case 88: return LocalizedString(en: "Machinist's Arm", ja: "銃", de: "Hauptwaffe der Maschinisten", fr: "Arme de machiniste")
        case 89: return LocalizedString(en: "Astrologian's Arm", ja: "天球儀", de: "Hauptwaffe der Astrologen", fr: "Arme d'astromancien")
        case 90: return LocalizedString(en: "Airship Hull", ja: "飛空艇部品(船体)", de: "Schiffbauteil (Rumpf)", fr: "Élément d'aéronef (coque)")
        case 91: return LocalizedString(en: "Airship Rigging", ja: "飛空艇部品(艤装)", de: "Schiffbauteil (Takelage)", fr: "Élément d'aéronef (gréement)")
        case 92: return LocalizedString(en: "Airship Aftcastle", ja: "飛空艇部品(船尾)", de: "Schiffbauteil (Heck)", fr: "Élément d'aéronef (poupe)")
        case 93: return LocalizedString(en: "Airship Forecastle", ja: "飛空艇部品(船首)", de: "Schiffbauteil (Bug)", fr: "Élément d'aéronef (proue)")
        case 94: return LocalizedString(en: "Orchestrion Roll", ja: "オーケストリオン譜", de: "Notenrolle", fr: "Rouleau pour orchestrion")
        case 95: return LocalizedString(en: "Painting", ja: "絵画", de: "Gemälde", fr: "Peinture")
        case 96: return LocalizedString(en: "Samurai's Arm", ja: "刀", de: "Hauptwaffe der Samurai", fr: "Arme de samouraï")
        case 97: return LocalizedString(en: "Red Mage's Arm", ja: "細剣", de: "Hauptwaffe der Rotmagier", fr: "Arme de mage rouge")
        case 98: return LocalizedString(en: "Scholar's Arm", ja: "魔道書(学者専用)", de: "Hauptwaffe der Gelehrten", fr: "Arme d'érudit")
        case 99: return LocalizedString(en: "Fisher's Secondary Tool", ja: "漁道具(副道具)", de: "Fischerzeug (sekundär)", fr: "Outil secondaire de pêcheur")
        case 100: return LocalizedString(en: "Currency", ja: "通貨", de: "Währung", fr: "Devises")
        case 101: return LocalizedString(en: "Submersible Hull", ja: "潜水艦パーツ(艦体)", de: "Tauchboot-Bauteil (Rumpf)", fr: "Élément de sous-marin (coque)")
        case 102: return LocalizedString(en: "Submersible Stern", ja: "潜水艦パーツ(艦尾)", de: "Tauchboot-Bauteil (Heck)", fr: "Élément de sous-marin (poupe)")
        case 103: return LocalizedString(en: "Submersible Bow", ja: "潜水艦パーツ(艦首)", de: "Tauchboot-Bauteil (Bug)", fr: "Élément de sous-marin (proue)")
        case 104: return LocalizedString(en: "Submersible Bridge", ja: "潜水艦パーツ(艦橋)", de: "Tauchboot-Bauteil (Brücke)", fr: "Élément de sous-marin (pont)")
        case 105: return LocalizedString(en: "Blue Mage's Arm", ja: "青魔器", de: "Blaumagier-Waffe", fr: "Arme de mage bleu")
        case 106: return LocalizedString(en: "Gunbreaker's Arm", ja: "ガンブレード", de: "Hauptwaffe der Revolverklingen", fr: "Arme de pistosabreur")
        case 107: return LocalizedString(en: "Dancer's Arm", ja: "投擲武器", de: "Hauptwaffe der Tänzer", fr: "Arme de danseur")
        case 108: return LocalizedString(en: "Reaper's Arm", ja: "両手鎌", de: "Hauptwaffe der Schnitter", fr: "Arme de faucheur")
        case 109: return LocalizedString(en: "Sage's Arm", ja: "賢具", de: "Hauptwaffe der Weisen", fr: "Arme de sage")
        default: return LocalizedString(en: "Other", ja: "その他", de: "Anderes", fr: "Autre")
        }
    }
}
