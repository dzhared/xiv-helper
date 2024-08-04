import Foundation

/// The possible classes/jobs available to the player.
struct ClassJob: Codable, Equatable {

    // MARK: Properties

    /// The ID of the class job, used to construct a struct.
    let id: Int

    /// The three-letter abbreviation of the job, i.e., `GNB`.
    let abbreviation: String

    /// The full name of the job.
    let name: String

    // MARK: Initialization

    /// Memberwise initializer, left private.
    private init(id: Int, name: String, abbreviation: String) {
        self.id = id
        self.name = name
        self.abbreviation = abbreviation
    }

    /// Initialize using only the ID.
    init(id: Int) {
        self = ClassJob.getClassJobFromId(id)
    }

    /// Initialize using only the acronym.
    init(acronym: String) {
        self = ClassJob.getClassJobFromAcronym(acronym: acronym)
    }

    /// Initialize using the `AllClassJob` enum.
    init(classJob: AllClassJob) {
        self = ClassJob.getClassJobFromAcronym(acronym: classJob.rawValue)
    }

    // MARK: Private Methods

    private static func getClassJobFromAcronym(acronym: String) -> ClassJob {
        switch acronym {
        case "GLA": return ClassJob(id: 1, name: "Gladiator", abbreviation: "GLA")
        case "PGL": return ClassJob(id: 2, name: "Pugilist", abbreviation: "PGL")
        case "MRD": return ClassJob(id: 3, name: "Marauder", abbreviation: "MRD")
        case "LNC": return ClassJob(id: 4, name: "Lancer", abbreviation: "LNC")
        case "ARC": return ClassJob(id: 5, name: "Archer", abbreviation: "ARC")
        case "CNJ": return ClassJob(id: 6, name: "Conjurer", abbreviation: "CNJ")
        case "THM": return ClassJob(id: 7, name: "Thaumaturge", abbreviation: "THM")
        case "CRP": return ClassJob(id: 8, name: "Carpenter", abbreviation: "CRP")
        case "BSM": return ClassJob(id: 9, name: "Blacksmith", abbreviation: "BSM")
        case "ARM": return ClassJob(id: 10, name: "Armorer", abbreviation: "ARM")
        case "GSM": return ClassJob(id: 11, name: "Goldsmith", abbreviation: "GSM")
        case "LTW": return ClassJob(id: 12, name: "Leatherworker", abbreviation: "LTW")
        case "WVR": return ClassJob(id: 13, name: "Weaver", abbreviation: "WVR")
        case "ALC": return ClassJob(id: 14, name: "Alchemist", abbreviation: "ALC")
        case "CUL": return ClassJob(id: 15, name: "Culinarian", abbreviation: "CUL")
        case "MIN": return ClassJob(id: 16, name: "Miner", abbreviation: "MIN")
        case "BTN": return ClassJob(id: 17, name: "Botanist", abbreviation: "BTN")
        case "FSH": return ClassJob(id: 18, name: "Fisher", abbreviation: "FSH")
        case "PLD": return ClassJob(id: 19, name: "Paladin", abbreviation: "PLD")
        case "MNK": return ClassJob(id: 20, name: "Monk", abbreviation: "MNK")
        case "WAR": return ClassJob(id: 21, name: "Warrior", abbreviation: "WAR")
        case "DRG": return ClassJob(id: 22, name: "Dragoon", abbreviation: "DRG")
        case "BRD": return ClassJob(id: 23, name: "Bard", abbreviation: "BRD")
        case "WHM": return ClassJob(id: 24, name: "White Mage", abbreviation: "WHM")
        case "BLM": return ClassJob(id: 25, name: "Black Mage", abbreviation: "BLM")
        case "ACN": return ClassJob(id: 26, name: "Arcanist", abbreviation: "ACN")
        case "SMN": return ClassJob(id: 27, name: "Summoner", abbreviation: "SMN")
        case "SCH": return ClassJob(id: 28, name: "Scholar", abbreviation: "SCH")
        case "ROG": return ClassJob(id: 29, name: "Rogue", abbreviation: "ROG")
        case "NIN": return ClassJob(id: 30, name: "Ninja", abbreviation: "NIN")
        case "MCH": return ClassJob(id: 31, name: "Machinist", abbreviation: "MCH")
        case "DRK": return ClassJob(id: 32, name: "Dark Knight", abbreviation: "DRK")
        case "AST": return ClassJob(id: 33, name: "Astrologian", abbreviation: "AST")
        case "SAM": return ClassJob(id: 34, name: "Samurai", abbreviation: "SAM")
        case "RDM": return ClassJob(id: 35, name: "Red Mage", abbreviation: "RDM")
        case "BLU": return ClassJob(id: 36, name: "Blue Mage", abbreviation: "BLU")
        case "GNB": return ClassJob(id: 37, name: "Gunbreaker", abbreviation: "GNB")
        case "DNC": return ClassJob(id: 38, name: "Dancer", abbreviation: "DNC")
        case "RPR": return ClassJob(id: 39, name: "Reaper", abbreviation: "RPR")
        case "SGE": return ClassJob(id: 40, name: "Sage", abbreviation: "SGE")
        case "VPR": return ClassJob(id: 41, name: "Viper", abbreviation: "VPR")
        case "PCT": return ClassJob(id: 42, name: "Pictomancer", abbreviation: "PCT")
        default: return ClassJob(id: 0, name: "Adventurer", abbreviation: "ADV")
        }
    }

    /// Returns a `ClassJob` from a given ID.
    private static func getClassJobFromId(_ id: Int) -> ClassJob {
        switch id {
        case 1:  return ClassJob(id: 1, name: "Gladiator", abbreviation: "GLA")
        case 2:  return ClassJob(id: 2, name: "Pugilist", abbreviation: "PGL")
        case 3:  return ClassJob(id: 3, name: "Marauder", abbreviation: "MRD")
        case 4:  return ClassJob(id: 4, name: "Lancer", abbreviation: "LNC")
        case 5:  return ClassJob(id: 5, name: "Archer", abbreviation: "ARC")
        case 6:  return ClassJob(id: 6, name: "Conjurer", abbreviation: "CNJ")
        case 7:  return ClassJob(id: 7, name: "Thaumaturge", abbreviation: "THM")
        case 8:  return ClassJob(id: 8, name: "Carpenter", abbreviation: "CRP")
        case 9:  return ClassJob(id: 9, name: "Blacksmith", abbreviation: "BSM")
        case 10: return ClassJob(id: 10, name: "Armorer", abbreviation: "ARM")
        case 11: return ClassJob(id: 11, name: "Goldsmith", abbreviation: "GSM")
        case 12: return ClassJob(id: 12, name: "Leatherworker", abbreviation: "LTW")
        case 13: return ClassJob(id: 13, name: "Weaver", abbreviation: "WVR")
        case 14: return ClassJob(id: 14, name: "Alchemist", abbreviation: "ALC")
        case 15: return ClassJob(id: 15, name: "Culinarian", abbreviation: "CUL")
        case 16: return ClassJob(id: 16, name: "Miner", abbreviation: "MIN")
        case 17: return ClassJob(id: 17, name: "Botanist", abbreviation: "BTN")
        case 18: return ClassJob(id: 18, name: "Fisher", abbreviation: "FSH")
        case 19: return ClassJob(id: 19, name: "Paladin", abbreviation: "PLD")
        case 20: return ClassJob(id: 20, name: "Monk", abbreviation: "MNK")
        case 21: return ClassJob(id: 21, name: "Warrior", abbreviation: "WAR")
        case 22: return ClassJob(id: 22, name: "Dragoon", abbreviation: "DRG")
        case 23: return ClassJob(id: 23, name: "Bard", abbreviation: "BRD")
        case 24: return ClassJob(id: 24, name: "White Mage", abbreviation: "WHM")
        case 25: return ClassJob(id: 25, name: "Black Mage", abbreviation: "BLM")
        case 26: return ClassJob(id: 26, name: "Arcanist", abbreviation: "ACN")
        case 27: return ClassJob(id: 27, name: "Summoner", abbreviation: "SMN")
        case 28: return ClassJob(id: 28, name: "Scholar", abbreviation: "SCH")
        case 29: return ClassJob(id: 29, name: "Rogue", abbreviation: "ROG")
        case 30: return ClassJob(id: 30, name: "Ninja", abbreviation: "NIN")
        case 31: return ClassJob(id: 31, name: "Machinist", abbreviation: "MCH")
        case 32: return ClassJob(id: 32, name: "Dark Knight", abbreviation: "DRK")
        case 33: return ClassJob(id: 33, name: "Astrologian", abbreviation: "AST")
        case 34: return ClassJob(id: 34, name: "Samurai", abbreviation: "SAM")
        case 35: return ClassJob(id: 35, name: "Red Mage", abbreviation: "RDM")
        case 36: return ClassJob(id: 36, name: "Blue Mage", abbreviation: "BLU")
        case 37: return ClassJob(id: 37, name: "Gunbreaker", abbreviation: "GNB")
        case 38: return ClassJob(id: 38, name: "Dancer", abbreviation: "DNC")
        case 39: return ClassJob(id: 39, name: "Reaper", abbreviation: "RPR")
        case 40: return ClassJob(id: 40, name: "Sage", abbreviation: "SGE")
        case 41: return ClassJob(id: 41, name: "Viper", abbreviation: "VPR")
        case 42: return ClassJob(id: 42, name: "Pictomancer", abbreviation: "PCT")
        default: return ClassJob(id: 0, name: "Adventurer", abbreviation: "ADV")
        }
    }
}
