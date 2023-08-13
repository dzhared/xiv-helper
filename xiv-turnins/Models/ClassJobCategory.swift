import Foundation

// MARK: - ClassJobCategory

struct ClassJobCategory {
    
    // MARK: Properties
    
    /// The acronym for the class.
    let equipClass: String?
    
    /// The full name of the class.
    var fullEquipClass: String {
        return getFullJobName(for: equipClass ?? "All Classes")
    }
    
    // MARK: Example
    
    static let example: ClassJobCategory = ClassJobCategory(equipClass: "BTN")
}

// MARK: Codable

extension ClassJobCategory: Codable {
    enum CodingKeys: String, CodingKey {
        case equipClass = "Name"
    }
}

// MARK: - Functions

/// Returns the abbreviation and full name of a job from its ID number.
func getJobAcronym(id: Int) -> (String, String) {
    switch id {
    case 1:
        return ("GLA", "Gladiator")
    case 2:
        return ("PUG", "Pugilist")
    case 3:
        return ("MRD", "Marauder")
    case 4:
        return ("LNC", "Lancer")
    case 5:
        return ("ARC", "Archer")
    case 6:
        return ("CNJ", "Conjurer")
    case 7:
        return ("THM", "Thaumaturge")
    case 8:
        return ("CRP", "Carpenter")
    case 9:
        return ("BSM", "Blacksmith")
    case 10:
        return ("ARM", "Armorer")
    case 11:
        return ("GSM", "Goldsmith")
    case 12:
        return ("LTW", "Leatherworker")
    case 13:
        return ("WVR", "Weaver")
    case 14:
        return ("ALC", "Alchemist")
    case 15:
        return ("CUL", "Culinarian")
    case 16:
        return ("MIN", "Miner")
    case 17:
        return ("BTN", "Botanist")
    case 18:
        return ("FSH", "Fisher")
    case 19:
        return ("PLD", "Paladin")
    case 20:
        return ("MNK", "Monk")
    case 21:
        return ("WAR", "Warrior")
    case 22:
        return ("DRG", "Dragoon")
    case 23:
        return ("BRD", "Bard")
    case 24:
        return ("WHM", "White Mage")
    case 25:
        return ("BLM", "Black Mage")
    case 26:
        return ("ACN", "Arcanist")
    case 27:
        return ("SMN", "Summoner")
    case 28:
        return ("SCH", "Scholar")
    case 29:
        return ("ROG", "Rogue")
    case 30:
        return ("NIN", "Ninja")
    case 31:
        return ("MCH", "Machinist")
    case 32:
        return ("DRK", "Dark Knight")
    case 33:
        return ("AST", "Astrologian")
    case 34:
        return ("SAM", "Samurai")
    case 35:
        return ("RDM", "Red Mage")
    case 36:
        return ("BLU", "Blue Mage")
    case 37:
        return ("GNB", "Gunbreaker")
    case 38:
        return ("DNC", "Dancer")
    case 39:
        return ("RPR", "Reaper")
    case 40:
        return ("SGE", "Sage")
    default:
        return ("ADV", "Adventurer")
    }
}

/// Returns the full name of a job from its abbreviation.
func getFullJobName(for abbreviation: String) -> String {
    switch abbreviation {
    case "GLA":
        return "Gladiator"
    case "PUG":
        return "Pugilist"
    case "MRD":
        return "Marauder"
    case "LNC":
        return "Lancer"
    case "ARC":
        return "Archer"
    case "CNJ":
        return "Conjurer"
    case "THM":
        return "Thaumaturge"
    case "CRP":
        return "Carpenter"
    case "BSM":
        return "Blacksmith"
    case "ARM":
        return "Armorer"
    case "GSM":
        return "Goldsmith"
    case "LTW":
        return "Leatherworker"
    case "WVR":
        return "Weaver"
    case "ALC":
        return "Alchemist"
    case "CUL":
        return "Culinarian"
    case "MIN":
        return "Miner"
    case "BTN":
        return "Botanist"
    case "FSH":
        return "Fisher"
    case "PLD":
        return "Paladin"
    case "MNK":
        return "Monk"
    case "WAR":
        return "Warrior"
    case "DRG":
        return "Dragoon"
    case "BRD":
        return "Bard"
    case "WHM":
        return "White Mage"
    case "BLM":
        return "Black Mage"
    case "ACN":
        return "Arcanist"
    case "SMN":
        return "Summoner"
    case "SCH":
        return "Scholar"
    case "ROG":
        return "Rogue"
    case "NIN":
        return "Ninja"
    case "MCH":
        return "Machinist"
    case "DRK":
        return "Dark Knight"
    case "AST":
        return "Astrologian"
    case "SAM":
        return "Samurai"
    case "RDM":
        return "Red Mage"
    case "BLU":
        return "Blue Mage"
    case "GNB":
        return "Gunbreaker"
    case "DNC":
        return "Dancer"
    case "RPR":
        return "Reaper"
    case "SGE":
        return "Sage"
    default:
        return "Adventurer"
    }
}
