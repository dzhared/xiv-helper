import Foundation

/// The parameters that an item can modify.
struct BaseParam: Codable, Equatable {

    // MARK: Properties

    /// The unique ID of the parameter.
    let id: Int

    /// The name of the parameter.
    let name: String

    // MARK: Initialization

    /// Memberwise initializer, left private.
    private init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    /// Initialize using only the ID.
    init(id: Int) {
        let baseParam = BaseParam.getBaseParamFromId(id)
        self.id = baseParam.id
        self.name = baseParam.name
    }

    // MARK: Private Methods

    /// Returns a `BaseParam` from a given ID.
    private static func getBaseParamFromId(_ id: Int) -> BaseParam {
        switch id {
        case 1: return BaseParam(id: 1, name: "Strength")
        case 2: return BaseParam(id: 2, name: "Dexterity")
        case 3: return BaseParam(id: 3, name: "Vitality")
        case 4: return BaseParam(id: 4, name: "Intelligence")
        case 5: return BaseParam(id: 5, name: "Mind")
        case 6: return BaseParam(id: 6, name: "Piety")
        case 7: return BaseParam(id: 7, name: "HP")
        case 8: return BaseParam(id: 8, name: "MP")
        case 9: return BaseParam(id: 9, name: "TP")
        case 10: return BaseParam(id: 10, name: "GP")
        case 11: return BaseParam(id: 11, name: "CP")
        case 12: return BaseParam(id: 12, name: "Damage")
        case 13: return BaseParam(id: 13, name: "Magic Damage")
        case 14: return BaseParam(id: 14, name: "Delay")
        case 15: return BaseParam(id: 15, name: "Additional Effect:")
        case 16: return BaseParam(id: 16, name: "Attack Speed")
        case 17: return BaseParam(id: 17, name: "Block Rate")
        case 18: return BaseParam(id: 18, name: "Block Strength")
        case 19: return BaseParam(id: 19, name: "Tenacity")
        case 20: return BaseParam(id: 20, name: "Attack Power")
        case 21: return BaseParam(id: 21, name: "Defense")
        case 22: return BaseParam(id: 22, name: "Direct Hit Rate")
        case 23: return BaseParam(id: 23, name: "Evasion")
        case 24: return BaseParam(id: 24, name: "Magic Defense")
        case 25: return BaseParam(id: 25, name: "Critical Hit Power")
        case 26: return BaseParam(id: 26, name: "Critical Hit Resilience")
        case 27: return BaseParam(id: 27, name: "Critical Hit")
        case 28: return BaseParam(id: 28, name: "Critical Hit Evasion")
        case 29: return BaseParam(id: 29, name: "Slashing Resistance")
        case 30: return BaseParam(id: 30, name: "Piercing Resistance")
        case 31: return BaseParam(id: 31, name: "Blunt Resistance")
        case 32: return BaseParam(id: 32, name: "Projectile Resistance")
        case 33: return BaseParam(id: 33, name: "Attack Magic Potency")
        case 34: return BaseParam(id: 34, name: "Healing Magic Potency")
        case 35: return BaseParam(id: 35, name: "Enhancement Magic Potency")
        case 36: return BaseParam(id: 36, name: "Elemental Bonus")
        case 37: return BaseParam(id: 37, name: "Fire Resistance")
        case 38: return BaseParam(id: 38, name: "Ice Resistance")
        case 39: return BaseParam(id: 39, name: "Wind Resistance")
        case 40: return BaseParam(id: 40, name: "Earth Resistance")
        case 41: return BaseParam(id: 41, name: "Lightning Resistance")
        case 42: return BaseParam(id: 42, name: "Water Resistance")
        case 43: return BaseParam(id: 43, name: "Magic Resistance")
        case 44: return BaseParam(id: 44, name: "Determination")
        case 45: return BaseParam(id: 45, name: "Skill Speed")
        case 46: return BaseParam(id: 46, name: "Spell Speed")
        case 47: return BaseParam(id: 47, name: "Haste")
        case 48: return BaseParam(id: 48, name: "Morale")
        case 49: return BaseParam(id: 49, name: "Enmity")
        case 50: return BaseParam(id: 50, name: "Enmity Reduction")
        case 51: return BaseParam(id: 51, name: "Desynthesis Skill Gain")
        case 52: return BaseParam(id: 52, name: "EXP Bonus")
        case 53: return BaseParam(id: 53, name: "Regen")
        case 54: return BaseParam(id: 54, name: "Refresh")
        case 55: return BaseParam(id: 55, name: "Main Attribute")
        case 56: return BaseParam(id: 56, name: "Secondary Attribute")
        case 57: return BaseParam(id: 57, name: "Slow Resistance")
        case 58: return BaseParam(id: 58, name: "Petrification Resistance")
        case 59: return BaseParam(id: 59, name: "Paralysis Resistance")
        case 60: return BaseParam(id: 60, name: "Silence Resistance")
        case 61: return BaseParam(id: 61, name: "Blind Resistance")
        case 62: return BaseParam(id: 62, name: "Poison Resistance")
        case 63: return BaseParam(id: 63, name: "Stun Resistance")
        case 64: return BaseParam(id: 64, name: "Sleep Resistance")
        case 65: return BaseParam(id: 65, name: "Bind Resistance")
        case 66: return BaseParam(id: 66, name: "Heavy Resistance")
        case 67: return BaseParam(id: 67, name: "Doom Resistance")
        case 68: return BaseParam(id: 68, name: "Reduced Durability Loss")
        case 69: return BaseParam(id: 69, name: "Increased Spiritbond Gain")
        case 70: return BaseParam(id: 70, name: "Craftsmanship")
        case 71: return BaseParam(id: 71, name: "Control")
        case 72: return BaseParam(id: 72, name: "Gathering")
        case 73: return BaseParam(id: 73, name: "Perception")
        default: return BaseParam(id: 0, name: "Unknown")
        }
    }
}
