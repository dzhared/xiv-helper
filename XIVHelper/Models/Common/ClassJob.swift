import SwiftUI

/// The possible classes/jobs available to the player.
struct ClassJob: Codable, Equatable {

    // MARK: Properties

    /// The ID of the class job, used to construct a struct.
    let id: Int

    /// The three-letter abbreviation of the job, i.e., `GNB`.
    let abbreviation: String

    /// The icon for the job.
    var icon: Image {
        return ClassJob.getIconFromId(id)
    }

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

    // MARK: Private Methods

    /// From a given three-letter acronym (i.e., "WHM"), return the corresponding ClassJob.
    ///
    /// - Parameter acronym: The acronym of the class/job to be retrieved.
    /// - Returns: The corresponding `ClassJob`.
    ///
    private static func getClassJobFromAcronym(acronym: String) -> ClassJob {
        switch acronym {
        case "GLA": return ClassJob(id: 1, name: AppStrings.Job.gladiator, abbreviation: AppStrings.Job.gladiatorAbbv)
        case "PGL": return ClassJob(id: 2, name: AppStrings.Job.pugilist, abbreviation: AppStrings.Job.pugilistAbbv)
        case "MRD": return ClassJob(id: 3, name: AppStrings.Job.marauder, abbreviation: AppStrings.Job.marauderAbbv)
        case "LNC": return ClassJob(id: 4, name: AppStrings.Job.lancer, abbreviation: AppStrings.Job.lancerAbbv)
        case "ARC": return ClassJob(id: 5, name: AppStrings.Job.archer, abbreviation: AppStrings.Job.archerAbbv)
        case "CNJ": return ClassJob(id: 6, name: AppStrings.Job.conjurer, abbreviation: AppStrings.Job.conjurerAbbv)
        case "THM": return ClassJob(id: 7, name: AppStrings.Job.thaumaturge, abbreviation: AppStrings.Job.thaumaturgeAbbv)
        case "CRP": return ClassJob(id: 8, name: AppStrings.Job.carpenter, abbreviation: AppStrings.Job.carpenterAbbv)
        case "BSM": return ClassJob(id: 9, name: AppStrings.Job.blacksmith, abbreviation: AppStrings.Job.blacksmithAbbv)
        case "ARM": return ClassJob(id: 10, name: AppStrings.Job.armorer, abbreviation: AppStrings.Job.armorerAbbv)
        case "GSM": return ClassJob(id: 11, name: AppStrings.Job.goldsmith, abbreviation: AppStrings.Job.goldsmithAbbv)
        case "LTW": return ClassJob(id: 12, name: AppStrings.Job.leatherworker, abbreviation: AppStrings.Job.leatherworkerAbbv)
        case "WVR": return ClassJob(id: 13, name: AppStrings.Job.weaver, abbreviation: AppStrings.Job.weaverAbbv)
        case "ALC": return ClassJob(id: 14, name: AppStrings.Job.alchemist, abbreviation: AppStrings.Job.alchemistAbbv)
        case "CUL": return ClassJob(id: 15, name: AppStrings.Job.culinarian, abbreviation: AppStrings.Job.culinarianAbbv)
        case "MIN": return ClassJob(id: 16, name: AppStrings.Job.miner, abbreviation: AppStrings.Job.minerAbbv)
        case "BTN": return ClassJob(id: 17, name: AppStrings.Job.botanist, abbreviation: AppStrings.Job.botanistAbbv)
        case "FSH": return ClassJob(id: 18, name: AppStrings.Job.fisher, abbreviation: AppStrings.Job.fisherAbbv)
        case "PLD": return ClassJob(id: 19, name: AppStrings.Job.paladin, abbreviation: AppStrings.Job.paladinAbbv)
        case "MNK": return ClassJob(id: 20, name: AppStrings.Job.monk, abbreviation: AppStrings.Job.monkAbbv)
        case "WAR": return ClassJob(id: 21, name: AppStrings.Job.warrior, abbreviation: AppStrings.Job.warriorAbbv)
        case "DRG": return ClassJob(id: 22, name: AppStrings.Job.dragoon, abbreviation: AppStrings.Job.dragoonAbbv)
        case "BRD": return ClassJob(id: 23, name: AppStrings.Job.bard, abbreviation: AppStrings.Job.bardAbbv)
        case "WHM": return ClassJob(id: 24, name: AppStrings.Job.whiteMage, abbreviation: AppStrings.Job.whiteMageAbbv)
        case "BLM": return ClassJob(id: 25, name: AppStrings.Job.blackMage, abbreviation: AppStrings.Job.blackMageAbbv)
        case "ACN": return ClassJob(id: 26, name: AppStrings.Job.arcanist, abbreviation: AppStrings.Job.arcanistAbbv)
        case "SMN": return ClassJob(id: 27, name: AppStrings.Job.summoner, abbreviation: AppStrings.Job.summonerAbbv)
        case "SCH": return ClassJob(id: 28, name: AppStrings.Job.scholar, abbreviation: AppStrings.Job.scholarAbbv)
        case "ROG": return ClassJob(id: 29, name: AppStrings.Job.rogue, abbreviation: AppStrings.Job.rogueAbbv)
        case "NIN": return ClassJob(id: 30, name: AppStrings.Job.ninja, abbreviation: AppStrings.Job.ninjaAbbv)
        case "MCH": return ClassJob(id: 31, name: AppStrings.Job.machinist, abbreviation: AppStrings.Job.machinistAbbv)
        case "DRK": return ClassJob(id: 32, name: AppStrings.Job.darkKnight, abbreviation: AppStrings.Job.darkKnightAbbv)
        case "AST": return ClassJob(id: 33, name: AppStrings.Job.astrologian, abbreviation: AppStrings.Job.astrologianAbbv)
        case "SAM": return ClassJob(id: 34, name: AppStrings.Job.samurai, abbreviation: AppStrings.Job.samuraiAbbv)
        case "RDM": return ClassJob(id: 35, name: AppStrings.Job.redMage, abbreviation: AppStrings.Job.redMageAbbv)
        case "BLU": return ClassJob(id: 36, name: AppStrings.Job.blueMage, abbreviation: AppStrings.Job.blueMageAbbv)
        case "GNB": return ClassJob(id: 37, name: AppStrings.Job.gunbreaker, abbreviation: AppStrings.Job.gunbreakerAbbv)
        case "DNC": return ClassJob(id: 38, name: AppStrings.Job.dancer, abbreviation: AppStrings.Job.dancerAbbv)
        case "RPR": return ClassJob(id: 39, name: AppStrings.Job.reaper, abbreviation: AppStrings.Job.reaperAbbv)
        case "SGE": return ClassJob(id: 40, name: AppStrings.Job.sage, abbreviation: AppStrings.Job.sageAbbv)
        case "VPR": return ClassJob(id: 41, name: AppStrings.Job.viper, abbreviation: AppStrings.Job.viperAbbv)
        case "PCT": return ClassJob(id: 42, name: AppStrings.Job.pictomancer, abbreviation: AppStrings.Job.pictomancerAbbv)
        default: return ClassJob(id: 0, name: AppStrings.Job.adventurer, abbreviation: AppStrings.Job.adventurerAbbv)
        }
    }

    /// Returns a `ClassJob` from a given ID.
    ///
    /// - Parameter id: The ID of the class/job to be retrieved.
    /// - Returns: The corresponding `ClassJob`.
    ///
    private static func getClassJobFromId(_ id: Int) -> ClassJob {
        switch id {
        case 1: return ClassJob(id: 1, name: AppStrings.Job.gladiator, abbreviation: AppStrings.Job.gladiatorAbbv)
        case 2: return ClassJob(id: 2, name: AppStrings.Job.pugilist, abbreviation: AppStrings.Job.pugilistAbbv)
        case 3: return ClassJob(id: 3, name: AppStrings.Job.marauder, abbreviation: AppStrings.Job.marauderAbbv)
        case 4: return ClassJob(id: 4, name: AppStrings.Job.lancer, abbreviation: AppStrings.Job.lancerAbbv)
        case 5: return ClassJob(id: 5, name: AppStrings.Job.archer, abbreviation: AppStrings.Job.archerAbbv)
        case 6: return ClassJob(id: 6, name: AppStrings.Job.conjurer, abbreviation: AppStrings.Job.conjurerAbbv)
        case 7: return ClassJob(id: 7, name: AppStrings.Job.thaumaturge, abbreviation: AppStrings.Job.thaumaturgeAbbv)
        case 8: return ClassJob(id: 8, name: AppStrings.Job.carpenter, abbreviation: AppStrings.Job.carpenterAbbv)
        case 9: return ClassJob(id: 9, name: AppStrings.Job.blacksmith, abbreviation: AppStrings.Job.blacksmithAbbv)
        case 10: return ClassJob(id: 10, name: AppStrings.Job.armorer, abbreviation: AppStrings.Job.armorerAbbv)
        case 11: return ClassJob(id: 11, name: AppStrings.Job.goldsmith, abbreviation: AppStrings.Job.goldsmithAbbv)
        case 12: return ClassJob(id: 12, name: AppStrings.Job.leatherworker, abbreviation: AppStrings.Job.leatherworkerAbbv)
        case 13: return ClassJob(id: 13, name: AppStrings.Job.weaver, abbreviation: AppStrings.Job.weaverAbbv)
        case 14: return ClassJob(id: 14, name: AppStrings.Job.alchemist, abbreviation: AppStrings.Job.alchemistAbbv)
        case 15: return ClassJob(id: 15, name: AppStrings.Job.culinarian, abbreviation: AppStrings.Job.culinarianAbbv)
        case 16: return ClassJob(id: 16, name: AppStrings.Job.miner, abbreviation: AppStrings.Job.minerAbbv)
        case 17: return ClassJob(id: 17, name: AppStrings.Job.botanist, abbreviation: AppStrings.Job.botanistAbbv)
        case 18: return ClassJob(id: 18, name: AppStrings.Job.fisher, abbreviation: AppStrings.Job.fisherAbbv)
        case 19: return ClassJob(id: 19, name: AppStrings.Job.paladin, abbreviation: AppStrings.Job.paladinAbbv)
        case 20: return ClassJob(id: 20, name: AppStrings.Job.monk, abbreviation: AppStrings.Job.monkAbbv)
        case 21: return ClassJob(id: 21, name: AppStrings.Job.warrior, abbreviation: AppStrings.Job.warriorAbbv)
        case 22: return ClassJob(id: 22, name: AppStrings.Job.dragoon, abbreviation: AppStrings.Job.dragoonAbbv)
        case 23: return ClassJob(id: 23, name: AppStrings.Job.bard, abbreviation: AppStrings.Job.bardAbbv)
        case 24: return ClassJob(id: 24, name: AppStrings.Job.whiteMage, abbreviation: AppStrings.Job.whiteMageAbbv)
        case 25: return ClassJob(id: 25, name: AppStrings.Job.blackMage, abbreviation: AppStrings.Job.blackMageAbbv)
        case 26: return ClassJob(id: 26, name: AppStrings.Job.arcanist, abbreviation: AppStrings.Job.arcanistAbbv)
        case 27: return ClassJob(id: 27, name: AppStrings.Job.summoner, abbreviation: AppStrings.Job.summonerAbbv)
        case 28: return ClassJob(id: 28, name: AppStrings.Job.scholar, abbreviation: AppStrings.Job.scholarAbbv)
        case 29: return ClassJob(id: 29, name: AppStrings.Job.rogue, abbreviation: AppStrings.Job.rogueAbbv)
        case 30: return ClassJob(id: 30, name: AppStrings.Job.ninja, abbreviation: AppStrings.Job.ninjaAbbv)
        case 31: return ClassJob(id: 31, name: AppStrings.Job.machinist, abbreviation: AppStrings.Job.machinistAbbv)
        case 32: return ClassJob(id: 32, name: AppStrings.Job.darkKnight, abbreviation: AppStrings.Job.darkKnightAbbv)
        case 33: return ClassJob(id: 33, name: AppStrings.Job.astrologian, abbreviation: AppStrings.Job.astrologianAbbv)
        case 34: return ClassJob(id: 34, name: AppStrings.Job.samurai, abbreviation: AppStrings.Job.samuraiAbbv)
        case 35: return ClassJob(id: 35, name: AppStrings.Job.redMage, abbreviation: AppStrings.Job.redMageAbbv)
        case 36: return ClassJob(id: 36, name: AppStrings.Job.blueMage, abbreviation: AppStrings.Job.blueMageAbbv)
        case 37: return ClassJob(id: 37, name: AppStrings.Job.gunbreaker, abbreviation: AppStrings.Job.gunbreakerAbbv)
        case 38: return ClassJob(id: 38, name: AppStrings.Job.dancer, abbreviation: AppStrings.Job.dancerAbbv)
        case 39: return ClassJob(id: 39, name: AppStrings.Job.reaper, abbreviation: AppStrings.Job.reaperAbbv)
        case 40: return ClassJob(id: 40, name: AppStrings.Job.sage, abbreviation: AppStrings.Job.sageAbbv)
        case 41: return ClassJob(id: 41, name: AppStrings.Job.viper, abbreviation: AppStrings.Job.viperAbbv)
        case 42: return ClassJob(id: 42, name: AppStrings.Job.pictomancer, abbreviation: AppStrings.Job.pictomancerAbbv)
        default: return ClassJob(id: 0, name: AppStrings.Job.adventurer, abbreviation: AppStrings.Job.adventurerAbbv)
        }
    }

    /// For the given ID, return the class/job's icon.
    ///
    /// - Parameter id: The ID of the class/job.
    /// - Returns: The `Image` for the class/job icon.
    ///
    private static func getIconFromId(_ id: Int) -> Image {
        switch id {
        case 1: return Image(.GLD)
        case 2: return Image(.PGL)
        case 3: return Image(.MRD)
        case 4: return Image(.LNC)
        case 5: return Image(.ARC)
        case 6: return Image(.CNJ)
        case 7: return Image(.THM)
        case 8: return Image(.CRP)
        case 9: return Image(.BSM)
        case 10: return Image(.ARM)
        case 11: return Image(.GSM)
        case 12: return Image(.LTW)
        case 13: return Image(.WVR)
        case 14: return Image(.ALC)
        case 15: return Image(.CUL)
        case 16: return Image(.MIN)
        case 17: return Image(.BTN)
        case 18: return Image(.FSH)
        case 19: return Image(.PLD)
        case 20: return Image(.MNK)
        case 21: return Image(.WAR)
        case 22: return Image(.DRG)
        case 23: return Image(.BRD)
        case 24: return Image(.WHM)
        case 25: return Image(.BLM)
        case 26: return Image(.ACN)
        case 27: return Image(.SMN)
        case 28: return Image(.SCH)
        case 29: return Image(.ROG)
        case 30: return Image(.NIN)
        case 31: return Image(.MCH)
        case 32: return Image(.DRK)
        case 33: return Image(.AST)
        case 34: return Image(.SAM)
        case 35: return Image(.RDM)
        case 36: return Image(.BLU)
        case 37: return Image(.GNB)
        case 38: return Image(.DNC)
        case 39: return Image(.RPR)
        case 40: return Image(.SGE)
        case 41: return Image(.VPR)
        case 42: return Image(.PCT)
        default: return Image("EXP")
        }
    }
}
