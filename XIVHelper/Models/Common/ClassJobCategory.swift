import Foundation

/// The category of ClassJobs available in a given context.
struct ClassJobCategory: Codable, Equatable {
    
    // MARK: Properties
    
    /// The unique ID of the category.
    let id: Int

    /// The string version of the category, such as `GLA PLD DRK GNB`, `Disciples of the Hand` or
    /// `All Classes`.
    let name: String

    /// An array of `ClassJob` objects included in the category.
    let classJobs: [ClassJob]

    // MARK: Initialization

    /// Memberwise initializer, left private.
    private init(id: Int, name: String, classJobs: [ClassJob]) {
        self.id = id
        self.name = name
        self.classJobs = classJobs
    }

    /// Initialize using only the ID.
    init(id: Int) {
        let classJobCategory = ClassJobCategory.getClassJobCategoryFromId(id)
        self.id = id
        self.name = classJobCategory.name
        self.classJobs = classJobCategory.classJobs
    }

    // MARK: Private Methods

    /// Returns a `ClassJobCategory` from a given ID.
    private static func getClassJobCategoryFromId(_ id: Int) -> ClassJobCategory {
        switch id {
        case 1: return ClassJobCategory(
            id: 1,
            name: "All Classes",
            classJobs: [
                ClassJob(id: 0),
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 8),
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
                ClassJob(id: 12),
                ClassJob(id: 13),
                ClassJob(id: 14),
                ClassJob(id: 15),
                ClassJob(id: 16),
                ClassJob(id: 17),
                ClassJob(id: 18),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 2: return ClassJobCategory(
            id: 2,
            name: "GLA",
            classJobs: [
                ClassJob(id: 1),
            ]
        )
        case 3: return ClassJobCategory(
            id: 3,
            name: "PGL",
            classJobs: [
                ClassJob(id: 2),
            ]
        )
        case 4: return ClassJobCategory(
            id: 4,
            name: "MRD",
            classJobs: [
                ClassJob(id: 3),
            ]
        )
        case 5: return ClassJobCategory(
            id: 5,
            name: "LNC",
            classJobs: [
                ClassJob(id: 4),
            ]
        )
        case 6: return ClassJobCategory(
            id: 6,
            name: "ARC",
            classJobs: [
                ClassJob(id: 5),
            ]
        )
        case 7: return ClassJobCategory(
            id: 7,
            name: "CNJ",
            classJobs: [
                ClassJob(id: 6),
            ]
        )
        case 8: return ClassJobCategory(
            id: 8,
            name: "THM",
            classJobs: [
                ClassJob(id: 7),
            ]
        )
        case 9: return ClassJobCategory(
            id: 9,
            name: "CRP",
            classJobs: [
                ClassJob(id: 8),
            ]
        )
        case 10: return ClassJobCategory(
            id: 10,
            name: "BSM",
            classJobs: [
                ClassJob(id: 9),
            ]
        )
        case 11: return ClassJobCategory(
            id: 11,
            name: "ARM",
            classJobs: [
                ClassJob(id: 10),
            ]
        )
        case 12: return ClassJobCategory(
            id: 12,
            name: "GSM",
            classJobs: [
                ClassJob(id: 11),
            ]
        )
        case 13: return ClassJobCategory(
            id: 13,
            name: "LTW",
            classJobs: [
                ClassJob(id: 12),
            ]
        )
        case 14: return ClassJobCategory(
            id: 14,
            name: "WVR",
            classJobs: [
                ClassJob(id: 13),
            ]
        )
        case 15: return ClassJobCategory(
            id: 15,
            name: "ALC",
            classJobs: [
                ClassJob(id: 14),
            ]
        )
        case 16: return ClassJobCategory(
            id: 16,
            name: "CUL",
            classJobs: [
                ClassJob(id: 15),
            ]
        )
        case 17: return ClassJobCategory(
            id: 17,
            name: "MIN",
            classJobs: [
                ClassJob(id: 16),
            ]
        )
        case 18: return ClassJobCategory(
            id: 18,
            name: "BTN",
            classJobs: [
                ClassJob(id: 17),
            ]
        )
        case 19: return ClassJobCategory(
            id: 19,
            name: "FSH",
            classJobs: [
                ClassJob(id: 18),
            ]
        )
        case 20: return ClassJobCategory(
            id: 20,
            name: "PLD",
            classJobs: [
                ClassJob(id: 19),
            ]
        )
        case 21: return ClassJobCategory(
            id: 21,
            name: "MNK",
            classJobs: [
                ClassJob(id: 20),
            ]
        )
        case 22: return ClassJobCategory(
            id: 22,
            name: "WAR",
            classJobs: [
                ClassJob(id: 21),
            ]
        )
        case 23: return ClassJobCategory(
            id: 23,
            name: "DRG",
            classJobs: [
                ClassJob(id: 22),
            ]
        )
        case 24: return ClassJobCategory(
            id: 24,
            name: "BRD",
            classJobs: [
                ClassJob(id: 23),
            ]
        )
        case 25: return ClassJobCategory(
            id: 25,
            name: "WHM",
            classJobs: [
                ClassJob(id: 24),
            ]
        )
        case 26: return ClassJobCategory(
            id: 26,
            name: "BLM",
            classJobs: [
                ClassJob(id: 25),
            ]
        )
        case 27: return ClassJobCategory(
            id: 27,
            name: "ACN",
            classJobs: [
                ClassJob(id: 26),
            ]
        )
        case 28: return ClassJobCategory(
            id: 28,
            name: "SMN",
            classJobs: [
                ClassJob(id: 27),
            ]
        )
        case 29: return ClassJobCategory(
            id: 29,
            name: "SCH",
            classJobs: [
                ClassJob(id: 28),
            ]
        )
        case 30: return ClassJobCategory(
            id: 30,
            name: "Disciple of War",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 31: return ClassJobCategory(
            id: 31,
            name: "Disciple of Magic",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 32: return ClassJobCategory(
            id: 32,
            name: "Disciple of the Land",
            classJobs: [
                ClassJob(id: 16),
                ClassJob(id: 17),
                ClassJob(id: 18),
            ]
        )
        case 33: return ClassJobCategory(
            id: 33,
            name: "Disciple of the Hand",
            classJobs: [
                ClassJob(id: 8),
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
                ClassJob(id: 12),
                ClassJob(id: 13),
                ClassJob(id: 14),
                ClassJob(id: 15),
            ]
        )
        case 34: return ClassJobCategory(
            id: 34,
            name: "Disciples of War or Magic",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 35: return ClassJobCategory(
            id: 35,
            name: "Disciples of the Land or Hand",
            classJobs: [
                ClassJob(id: 8),
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
                ClassJob(id: 12),
                ClassJob(id: 13),
                ClassJob(id: 14),
                ClassJob(id: 15),
                ClassJob(id: 16),
                ClassJob(id: 17),
                ClassJob(id: 18),
            ]
        )
        case 36: return ClassJobCategory(
            id: 36,
            name: "Any Disciple of War (excluding gladiators)",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 37: return ClassJobCategory(
            id: 37,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD WAR DRK",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 26),
                ClassJob(id: 29),
                ClassJob(id: 32),
            ]
        )
        case 38: return ClassJobCategory(
            id: 38,
            name: "GLA PLD",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 19),
            ]
        )
        case 39: return ClassJobCategory(
            id: 39,
            name: "GLA PGL MRD LNC ARC ROG PLD WAR DRK",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 29),
                ClassJob(id: 32),
            ]
        )
        case 40: return ClassJobCategory(
            id: 40,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN MNK WAR DRG BRD NIN",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 26),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 41: return ClassJobCategory(
            id: 41,
            name: "PGL MNK",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 20),
            ]
        )
        case 42: return ClassJobCategory(
            id: 42,
            name: "GLA PGL MRD LNC ARC ROG MNK WAR DRG BRD NIN",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 43: return ClassJobCategory(
            id: 43,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD MNK WAR DRG DRK",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 26),
                ClassJob(id: 29),
                ClassJob(id: 32),
            ]
        )
        case 44: return ClassJobCategory(
            id: 44,
            name: "MRD WAR",
            classJobs: [
                ClassJob(id: 3),
                ClassJob(id: 21),
            ]
        )
        case 45: return ClassJobCategory(
            id: 45,
            name: "GLA PGL MRD LNC ARC ROG PLD MNK WAR DRG DRK",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 29),
                ClassJob(id: 32),
            ]
        )
        case 46: return ClassJobCategory(
            id: 46,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN MNK DRG BRD NIN MCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 26),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
            ]
        )
        case 47: return ClassJobCategory(
            id: 47,
            name: "LNC DRG",
            classJobs: [
                ClassJob(id: 4),
                ClassJob(id: 22),
            ]
        )
        case 48: return ClassJobCategory(
            id: 48,
            name: "GLA PGL MRD LNC ARC ROG MNK DRG BRD NIN MCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
            ]
        )
        case 49: return ClassJobCategory(
            id: 49,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN BRD BLM SMN MCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 29),
                ClassJob(id: 31),
            ]
        )
        case 50: return ClassJobCategory(
            id: 50,
            name: "ARC BRD",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 23),
            ]
        )
        case 51: return ClassJobCategory(
            id: 51,
            name: "GLA PGL MRD LNC ARC ROG BRD MCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 31),
            ]
        )
        case 52: return ClassJobCategory(
            id: 52,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD WHM SCH AST",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 24),
                ClassJob(id: 26),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 33),
            ]
        )
        case 53: return ClassJobCategory(
            id: 53,
            name: "CNJ WHM",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 24),
            ]
        )
        case 54: return ClassJobCategory(
            id: 54,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN WHM BLM SMN SCH AST",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 33),
            ]
        )
        case 55: return ClassJobCategory(
            id: 55,
            name: "THM BLM",
            classJobs: [
                ClassJob(id: 7),
                ClassJob(id: 25),
            ]
        )
        case 56: return ClassJobCategory(
            id: 56,
            name: "GLA CNJ THM PLD WHM BLM",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 24),
                ClassJob(id: 25),
            ]
        )
        case 57: return ClassJobCategory(
            id: 57,
            name: "GLA THM PLD BLM",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 25),
            ]
        )
        case 58: return ClassJobCategory(
            id: 58,
            name: "GLA CNJ PLD WHM",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 6),
                ClassJob(id: 19),
                ClassJob(id: 24),
            ]
        )
        case 59: return ClassJobCategory(
            id: 59,
            name: "GLA MRD PLD WAR DRK GNB",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 3),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 60: return ClassJobCategory(
            id: 60,
            name: "GLA MRD LNC PLD WAR DRG DRK GNB RPR",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 32),
                ClassJob(id: 37),
                ClassJob(id: 39),
            ]
        )
        case 61: return ClassJobCategory(
            id: 61,
            name: "CNJ THM ACN WHM SCH AST",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 26),
                ClassJob(id: 28),
                ClassJob(id: 33),
            ]
        )
        case 62: return ClassJobCategory(
            id: 62,
            name: "CNJ THM ACN WHM BLM SMN SCH AST",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
            ]
        )
        case 63: return ClassJobCategory(
            id: 63,
            name: "THM ACN BLM SMN RDM BLU PCT",
            classJobs: [
                ClassJob(id: 7),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 42),
            ]
        )
        case 64: return ClassJobCategory(
            id: 64,
            name: "CNJ WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 65: return ClassJobCategory(
            id: 65,
            name: "PGL MNK SAM",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 20),
                ClassJob(id: 34),
            ]
        )
        case 66: return ClassJobCategory(
            id: 66,
            name: "ARC BRD MCH DNC",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 67: return ClassJobCategory(
            id: 67,
            name: "GLA PGL MRD LNC ROG MNK DRG NIN",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 68: return ClassJobCategory(
            id: 68,
            name: "ACN SMN SCH",
            classJobs: [
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
            ]
        )
        case 69: return ClassJobCategory(
            id: 69,
            name: "ACN SMN",
            classJobs: [
                ClassJob(id: 26),
                ClassJob(id: 27),
            ]
        )
        case 70: return ClassJobCategory(
            id: 70,
            name: "Any Disciple of the Hand (excluding culinarians)",
            classJobs: [
                ClassJob(id: 8),
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
                ClassJob(id: 12),
                ClassJob(id: 13),
                ClassJob(id: 14),
            ]
        )
        case 71: return ClassJobCategory(
            id: 71,
            name: "GLA PGL MRD LNC ARC ROG CNJ THM ACN WHM BLM SMN SCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
            ]
        )
        case 72: return ClassJobCategory(
            id: 72,
            name: "CNJ THM ACN WHM BLM SMN SCH",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
            ]
        )
        case 73: return ClassJobCategory(
            id: 73,
            name: "CNJ WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 76: return ClassJobCategory(
            id: 76,
            name: "LNC DRG RPR",
            classJobs: [
                ClassJob(id: 4),
                ClassJob(id: 22),
                ClassJob(id: 39),
            ]
        )
        case 84: return ClassJobCategory(
            id: 84,
            name: "PGL LNC MNK DRG SAM RPR",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 34),
                ClassJob(id: 39),
            ]
        )
        case 85: return ClassJobCategory(
            id: 85,
            name: "Jobs of the Disciples of War or Magic",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 86: return ClassJobCategory(
            id: 86,
            name: "PLD WAR DRK GNB MNK DRG NIN SAM",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
            ]
        )
        case 87: return ClassJobCategory(
            id: 87,
            name: "BRD MCH DNC BLM SMN RDM WHM SCH AST",
            classJobs: [
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 31),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 38),
            ]
        )
        case 88: return ClassJobCategory(
            id: 88,
            name: "GLA MRD PGL LNC ARC ROG PLD MNK WAR DRG BRD NIN MCH",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
            ]
        )
        case 89: return ClassJobCategory(
            id: 89,
            name: "BLM SMN RDM",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
            ]
        )
        case 90: return ClassJobCategory(
            id: 90,
            name: "ARC CNJ THM ACN WHM BRD BLM SMN SCH MCH AST",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 31),
                ClassJob(id: 33),
            ]
        )
        case 91: return ClassJobCategory(
            id: 91,
            name: "ROG",
            classJobs: [
                ClassJob(id: 29),
            ]
        )
        case 92: return ClassJobCategory(
            id: 92,
            name: "NIN",
            classJobs: [
                ClassJob(id: 30),
            ]
        )
        case 93: return ClassJobCategory(
            id: 93,
            name: "ROG NIN",
            classJobs: [
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 94: return ClassJobCategory(
            id: 94,
            name: "GLA PGL MRD LNC ARC ROG NIN",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 95: return ClassJobCategory(
            id: 95,
            name: "GLA PGL MRD LNC ROG NIN",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 96: return ClassJobCategory(
            id: 96,
            name: "MCH",
            classJobs: [
                ClassJob(id: 31),
            ]
        )
        case 97: return ClassJobCategory(
            id: 97,
            name: "PGL LNC ARC ROG MNK DRG BRD NIN MCH",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
            ]
        )
        case 98: return ClassJobCategory(
            id: 98,
            name: "DRK",
            classJobs: [
                ClassJob(id: 32),
            ]
        )
        case 99: return ClassJobCategory(
            id: 99,
            name: "AST",
            classJobs: [
                ClassJob(id: 33),
            ]
        )
        case 100: return ClassJobCategory(
            id: 100,
            name: "ARC ROG BRD NIN MCH",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
            ]
        )
        case 101: return ClassJobCategory(
            id: 101,
            name: "PGL LNC ROG MNK DRG NIN",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 29),
                ClassJob(id: 30),
            ]
        )
        case 102: return ClassJobCategory(
            id: 102,
            name: "PGL ROG MNK NIN SAM VPR",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 20),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 41),
            ]
        )
        case 103: return ClassJobCategory(
            id: 103,
            name: "ROG NIN VPR",
            classJobs: [
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 41),
            ]
        )
        case 105: return ClassJobCategory(
            id: 105,
            name: "ARC ROG BRD NIN MCH DNC VPR",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 38),
                ClassJob(id: 41),
            ]
        )
        case 106: return ClassJobCategory(
            id: 106,
            name: "GLA MRD PGL LNC ARC ROG BRD",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 29),
            ]
        )
        case 107: return ClassJobCategory(
            id: 107,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH NIN MCH DRK AST",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
            ]
        )
        case 108: return ClassJobCategory(
            id: 108,
            name: "Disciples of War or Magic",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 110: return ClassJobCategory(
            id: 110,
            name: "Jobs of the Disciples of War or Magic",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 111: return ClassJobCategory(
            id: 111,
            name: "SAM",
            classJobs: [
                ClassJob(id: 34),
            ]
        )
        case 112: return ClassJobCategory(
            id: 112,
            name: "RDM",
            classJobs: [
                ClassJob(id: 35),
            ]
        )
        case 113: return ClassJobCategory(
            id: 113,
            name: "GLA MRD PLD WAR DRK GNB",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 3),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 114: return ClassJobCategory(
            id: 114,
            name: "PGL LNC ROG MNK DRG NIN SAM RPR VPR",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 115: return ClassJobCategory(
            id: 115,
            name: "ARC BRD MCH DNC",
            classJobs: [
                ClassJob(id: 5),
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 116: return ClassJobCategory(
            id: 116,
            name: "THM ACN BLM SMN RDM BLU PCT",
            classJobs: [
                ClassJob(id: 7),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 42),
            ]
        )
        case 117: return ClassJobCategory(
            id: 117,
            name: "CNJ WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 118: return ClassJobCategory(
            id: 118,
            name: "PGL LNC ARC ROG MNK DRG BRD NIN MCH SAM DNC RPR VPR",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 119: return ClassJobCategory(
            id: 119,
            name: "PGL LNC THM ACN ROG MNK DRG BLM SMN NIN SAM RDM BLU RPR VPR PCT",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 7),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 120: return ClassJobCategory(
            id: 120,
            name: "CNJ THM ACN WHM BLM SMN SCH AST RDM BLU SGE PCT",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 121: return ClassJobCategory(
            id: 121,
            name: "PLD WAR DRK GNB",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 122: return ClassJobCategory(
            id: 122,
            name: "MNK DRG NIN SAM RPR VPR",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 123: return ClassJobCategory(
            id: 123,
            name: "BRD MCH DNC",
            classJobs: [
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 124: return ClassJobCategory(
            id: 124,
            name: "BLM SMN RDM BLU PCT",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 42),
            ]
        )
        case 125: return ClassJobCategory(
            id: 125,
            name: "WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 126: return ClassJobCategory(
            id: 126,
            name: "MNK DRG BRD NIN MCH SAM DNC RPR VPR",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 127: return ClassJobCategory(
            id: 127,
            name: "MNK DRG BLM SMN NIN SAM RDM BLU RPR VPR PCT",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 128: return ClassJobCategory(
            id: 128,
            name: "WHM BLM SMN SCH AST RDM BLU SGE PCT",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 36),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 129: return ClassJobCategory(
            id: 129,
            name: "BLU",
            classJobs: [
                ClassJob(id: 36),
            ]
        )
        case 130: return ClassJobCategory(
            id: 130,
            name: "All classes and jobs (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 0),
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 8),
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
                ClassJob(id: 12),
                ClassJob(id: 13),
                ClassJob(id: 14),
                ClassJob(id: 15),
                ClassJob(id: 16),
                ClassJob(id: 17),
                ClassJob(id: 18),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 131: return ClassJobCategory(
            id: 131,
            name: "MNK DRG BRD BLM SMN NIN MCH SAM RDM DNC RPR VPR PCT",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 132: return ClassJobCategory(
            id: 132,
            name: "MNK DRG BRD WHM BLM SMN SCH NIN MCH AST SAM RDM DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 133: return ClassJobCategory(
            id: 133,
            name: "WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 134: return ClassJobCategory(
            id: 134,
            name: "PLD WAR DRK GNB",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 135: return ClassJobCategory(
            id: 135,
            name: "PLD MNK WAR DRG BRD BLM SMN NIN MCH DRK SAM RDM GNB DNC RPR VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 136: return ClassJobCategory(
            id: 136,
            name: "PLD WAR WHM SCH DRK AST GNB SGE",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 37),
                ClassJob(id: 40),
            ]
        )
        case 137: return ClassJobCategory(
            id: 137,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH NIN MCH DRK AST SAM RDM GNB DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 138: return ClassJobCategory(
            id: 138,
            name: "PLD MNK WAR DRG NIN DRK SAM GNB RPR VPR",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 139: return ClassJobCategory(
            id: 139,
            name: "BRD MCH DNC",
            classJobs: [
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 140: return ClassJobCategory(
            id: 140,
            name: "WHM BLM SMN SCH AST RDM SGE PCT",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 141: return ClassJobCategory(
            id: 141,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH MCH DRK AST SAM RDM GNB DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 142: return ClassJobCategory(
            id: 142,
            name: "Any Disciple of War or Magic (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 143: return ClassJobCategory(
            id: 143,
            name: "Disciples of War (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 144: return ClassJobCategory(
            id: 144,
            name: "Any Disciple of Magic (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 145: return ClassJobCategory(
            id: 145,
            name: "PLD MNK WAR DRG BRD NIN MCH DRK SAM GNB DNC RPR VPR",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 146: return ClassJobCategory(
            id: 146,
            name: "Any job of the Disciples of War or Magic (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 147: return ClassJobCategory(
            id: 147,
            name: "BLM SMN RDM PCT",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 42),
            ]
        )
        case 148: return ClassJobCategory(
            id: 148,
            name: "MNK DRG NIN SAM RPR VPR",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 149: return ClassJobCategory(
            id: 149,
            name: "GNB",
            classJobs: [
                ClassJob(id: 37),
            ]
        )
        case 150: return ClassJobCategory(
            id: 150,
            name: "DNC",
            classJobs: [
                ClassJob(id: 38),
            ]
        )
        case 151: return ClassJobCategory(
            id: 151,
            name: "BSM, ARM, GSM",
            classJobs: [
                ClassJob(id: 9),
                ClassJob(id: 10),
                ClassJob(id: 11),
            ]
        )
        case 152: return ClassJobCategory(
            id: 152,
            name: "CRP, LTW, WVR",
            classJobs: [
                ClassJob(id: 8),
                ClassJob(id: 12),
                ClassJob(id: 13),
            ]
        )
        case 153: return ClassJobCategory(
            id: 153,
            name: "ALC, CUL",
            classJobs: [
                ClassJob(id: 14),
                ClassJob(id: 15),
            ]
        )
        case 154: return ClassJobCategory(
            id: 154,
            name: "MIN, BTN",
            classJobs: [
                ClassJob(id: 16),
                ClassJob(id: 17),
            ]
        )
        case 155: return ClassJobCategory(
            id: 155,
            name: "FSH",
            classJobs: [
                ClassJob(id: 18),
            ]
        )
        case 156: return ClassJobCategory(
            id: 156,
            name: "Tank (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 157: return ClassJobCategory(
            id: 157,
            name: "Healer (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 158: return ClassJobCategory(
            id: 158,
            name: "Physical DPS (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 159: return ClassJobCategory(
            id: 159,
            name: "Magical Ranged DPS (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 42),
            ]
        )
        case 160: return ClassJobCategory(
            id: 160,
            name: "ACN SCH",
            classJobs: [
                ClassJob(id: 26),
                ClassJob(id: 28),
            ]
        )
        case 161: return ClassJobCategory(
            id: 161,
            name: "GLA PGL MRD LNC ARC PLD MNK WAR DRG BRD ROG NIN MCH DRK SAM GNB DNC RPR VPR",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 162: return ClassJobCategory(
            id: 162,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH NIN MCH DRK AST SAM RDM GNB DNC",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
            ]
        )
        case 163: return ClassJobCategory(
            id: 163,
            name: "MNK DRG BRD BLM SMN NIN MCH SAM RDM DNC RPR VPR PCT",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 164: return ClassJobCategory(
            id: 164,
            name: "MNK DRG BRD WHM BLM SMN SCH NIN MCH AST SAM RDM DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 165: return ClassJobCategory(
            id: 165,
            name: "WHM SCH AST SGE",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 166: return ClassJobCategory(
            id: 166,
            name: "PLD WAR DRK GNB",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 167: return ClassJobCategory(
            id: 167,
            name: "PLD MNK WAR DRG BRD BLM SMN NIN MCH DRK SAM RDM GNB DNC RPR VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 168: return ClassJobCategory(
            id: 168,
            name: "PLD WAR WHM SCH DRK AST GNB SGE",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 37),
                ClassJob(id: 40),
            ]
        )
        case 169: return ClassJobCategory(
            id: 169,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH NIN MCH DRK AST SAM RDM GNB DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 170: return ClassJobCategory(
            id: 170,
            name: "PLD MNK WAR DRG NIN DRK SAM GNB RPR VPR",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 171: return ClassJobCategory(
            id: 171,
            name: "BRD MCH DNC",
            classJobs: [
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 172: return ClassJobCategory(
            id: 172,
            name: "WHM BLM SMN SCH AST RDM SGE PCT",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 173: return ClassJobCategory(
            id: 173,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH MCH DRK AST SAM RDM GNB DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 174: return ClassJobCategory(
            id: 174,
            name: "PLD MNK WAR DRG BRD NIN MCH DRK SAM GNB DNC RPR VPR",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 175: return ClassJobCategory(
            id: 175,
            name: "BLM SMN RDM PCT",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 42),
            ]
        )
        case 176: return ClassJobCategory(
            id: 176,
            name: "MNK DRG NIN SAM RPR VPR",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 177: return ClassJobCategory(
            id: 177,
            name: "MNK DRG BRD NIN MCH SAM DNC RPR VPR",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 34),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 178: return ClassJobCategory(
            id: 178,
            name: "PLD WAR BLM SMN DRK RDM GNB PCT",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 32),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 42),
            ]
        )
        case 179: return ClassJobCategory(
            id: 179,
            name: "WHM SMN SCH AST RDM SGE PCT",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        case 180: return ClassJobCategory(
            id: 180,
            name: "RPR",
            classJobs: [
                ClassJob(id: 39),
            ]
        )
        case 181: return ClassJobCategory(
            id: 181,
            name: "SGE",
            classJobs: [
                ClassJob(id: 40),
            ]
        )
        case 186: return ClassJobCategory(
            id: 186,
            name: "Tank (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 32),
                ClassJob(id: 37),
            ]
        )
        case 187: return ClassJobCategory(
            id: 187,
            name: "Healer (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 40),
            ]
        )
        case 188: return ClassJobCategory(
            id: 188,
            name: "Melee DPS (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 30),
                ClassJob(id: 34),
                ClassJob(id: 39),
                ClassJob(id: 41),
            ]
        )
        case 189: return ClassJobCategory(
            id: 189,
            name: "Physical Ranged DPS (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 23),
                ClassJob(id: 31),
                ClassJob(id: 38),
            ]
        )
        case 190: return ClassJobCategory(
            id: 190,
            name: "Magical Ranged DPS (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 42),
            ]
        )
        case 191: return ClassJobCategory(
            id: 191,
            name: "PLD MNK WAR DRG BRD WHM BLM SMN SCH NIN MCH DRK AST SAM RDM GNB DNC RPR SGE",
            classJobs: [
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
            ]
        )
        case 192: return ClassJobCategory(
            id: 192,
            name: "Any Disciple of War or Magic (excluding limited jobs)",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 193: return ClassJobCategory(
            id: 193,
            name: "PGL LNC ARC ROG CNJ THM ACN MNK DRG BRD WHM BLM SMN SCH NIN MCH AST SAM RDM DNC RPR SGE VPR PCT",
            classJobs: [
                ClassJob(id: 2),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 20),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 33),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 40),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 194: return ClassJobCategory(
            id: 194,
            name: "GLA MRD CNJ PLD WAR WHM SCH DRK AST GNB SGE",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 3),
                ClassJob(id: 6),
                ClassJob(id: 19),
                ClassJob(id: 21),
                ClassJob(id: 24),
                ClassJob(id: 28),
                ClassJob(id: 32),
                ClassJob(id: 33),
                ClassJob(id: 37),
                ClassJob(id: 40),
            ]
        )
        case 195: return ClassJobCategory(
            id: 195,
            name: "GLA MRD PGL LNC ARC ROG THM ACN PLD MNK WAR DRG BRD BLM SMN NIN MCH DRK SAM RDM GNB DNC RPR VPR PCT",
            classJobs: [
                ClassJob(id: 1),
                ClassJob(id: 2),
                ClassJob(id: 3),
                ClassJob(id: 4),
                ClassJob(id: 5),
                ClassJob(id: 7),
                ClassJob(id: 19),
                ClassJob(id: 20),
                ClassJob(id: 21),
                ClassJob(id: 22),
                ClassJob(id: 23),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 29),
                ClassJob(id: 30),
                ClassJob(id: 31),
                ClassJob(id: 32),
                ClassJob(id: 34),
                ClassJob(id: 35),
                ClassJob(id: 37),
                ClassJob(id: 38),
                ClassJob(id: 39),
                ClassJob(id: 41),
                ClassJob(id: 42),
            ]
        )
        case 196: return ClassJobCategory(
            id: 196,
            name: "VPR",
            classJobs: [
                ClassJob(id: 41),
            ]
        )
        case 197: return ClassJobCategory(
            id: 197,
            name: "PCT",
            classJobs: [
                ClassJob(id: 42),
            ]
        )
        case 198: return ClassJobCategory(
            id: 198,
            name: "THM BLM ACN SMN RDM PCT",
            classJobs: [
                ClassJob(id: 7),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 35),
                ClassJob(id: 42),
            ]
        )
        case 199: return ClassJobCategory(
            id: 199,
            name: "CNJ THM WHM BLM ACN SMN SCH AST RDM SGE PCT",
            classJobs: [
                ClassJob(id: 6),
                ClassJob(id: 7),
                ClassJob(id: 24),
                ClassJob(id: 25),
                ClassJob(id: 26),
                ClassJob(id: 27),
                ClassJob(id: 28),
                ClassJob(id: 33),
                ClassJob(id: 35),
                ClassJob(id: 40),
                ClassJob(id: 42),
            ]
        )
        default: return ClassJobCategory(id: 0, name: "Unknown", classJobs: [])
        }
    }
}
