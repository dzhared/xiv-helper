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
        case 1: return BaseParam(id: 1, name: AppStrings.Parameter.strength)
        case 2: return BaseParam(id: 2, name: AppStrings.Parameter.dexterity)
        case 3: return BaseParam(id: 3, name: AppStrings.Parameter.vitality)
        case 4: return BaseParam(id: 4, name: AppStrings.Parameter.intelligence)
        case 5: return BaseParam(id: 5, name: AppStrings.Parameter.mind)
        case 6: return BaseParam(id: 6, name: AppStrings.Parameter.piety)
        case 7: return BaseParam(id: 7, name: AppStrings.Parameter.hp)
        case 8: return BaseParam(id: 8, name: AppStrings.Parameter.mp)
        case 9: return BaseParam(id: 9, name: AppStrings.Parameter.tp)
        case 10: return BaseParam(id: 10, name: AppStrings.Parameter.gp)
        case 11: return BaseParam(id: 11, name: AppStrings.Parameter.cp)
        case 12: return BaseParam(id: 12, name: AppStrings.Parameter.physicalDamage)
        case 13: return BaseParam(id: 13, name: AppStrings.Parameter.magicDamage)
        case 14: return BaseParam(id: 14, name: AppStrings.Parameter.delay)
        case 15: return BaseParam(id: 15, name: AppStrings.Parameter.additionalEffect)
        case 16: return BaseParam(id: 16, name: AppStrings.Parameter.attackSpeed)
        case 17: return BaseParam(id: 17, name: AppStrings.Parameter.blockRate)
        case 18: return BaseParam(id: 18, name: AppStrings.Parameter.blockStrength)
        case 19: return BaseParam(id: 19, name: AppStrings.Parameter.tenacity)
        case 20: return BaseParam(id: 20, name: AppStrings.Parameter.attackPower)
        case 21: return BaseParam(id: 21, name: AppStrings.Parameter.defense)
        case 22: return BaseParam(id: 22, name: AppStrings.Parameter.directHitRate)
        case 23: return BaseParam(id: 23, name: AppStrings.Parameter.evasion)
        case 24: return BaseParam(id: 24, name: AppStrings.Parameter.magicDefense)
        case 25: return BaseParam(id: 25, name: AppStrings.Parameter.criticalHitPower)
        case 26: return BaseParam(id: 26, name: AppStrings.Parameter.criticalHitResilience)
        case 27: return BaseParam(id: 27, name: AppStrings.Parameter.criticalHit)
        case 28: return BaseParam(id: 28, name: AppStrings.Parameter.criticalHitEvasion)
        case 29: return BaseParam(id: 29, name: AppStrings.Parameter.slashingResistance)
        case 30: return BaseParam(id: 30, name: AppStrings.Parameter.piercingResistance)
        case 31: return BaseParam(id: 31, name: AppStrings.Parameter.bluntResistance)
        case 32: return BaseParam(id: 32, name: AppStrings.Parameter.projectileResistance)
        case 33: return BaseParam(id: 33, name: AppStrings.Parameter.attackMagicPotency)
        case 34: return BaseParam(id: 34, name: AppStrings.Parameter.healingMagicPotency)
        case 35: return BaseParam(id: 35, name: AppStrings.Parameter.enhancementMagicPotency)
        case 36: return BaseParam(id: 36, name: AppStrings.Parameter.elementalBonus)
        case 37: return BaseParam(id: 37, name: AppStrings.Parameter.fireResistance)
        case 38: return BaseParam(id: 38, name: AppStrings.Parameter.iceResistance)
        case 39: return BaseParam(id: 39, name: AppStrings.Parameter.windResistance)
        case 40: return BaseParam(id: 40, name: AppStrings.Parameter.earthResistance)
        case 41: return BaseParam(id: 41, name: AppStrings.Parameter.lightningResistance)
        case 42: return BaseParam(id: 42, name: AppStrings.Parameter.waterResistance)
        case 43: return BaseParam(id: 43, name: AppStrings.Parameter.magicResistance)
        case 44: return BaseParam(id: 44, name: AppStrings.Parameter.determination)
        case 45: return BaseParam(id: 45, name: AppStrings.Parameter.skillSpeed)
        case 46: return BaseParam(id: 46, name: AppStrings.Parameter.spellSpeed)
        case 47: return BaseParam(id: 47, name: AppStrings.Parameter.haste)
        case 48: return BaseParam(id: 48, name: AppStrings.Parameter.morale)
        case 49: return BaseParam(id: 49, name: AppStrings.Parameter.enmity)
        case 50: return BaseParam(id: 50, name: AppStrings.Parameter.enmityReduction)
        case 51: return BaseParam(id: 51, name: AppStrings.Parameter.desynthesisSkillGain)
        case 52: return BaseParam(id: 52, name: AppStrings.Parameter.expBonus)
        case 53: return BaseParam(id: 53, name: AppStrings.Parameter.regen)
        case 54: return BaseParam(id: 54, name: AppStrings.Parameter.refresh)
        case 55: return BaseParam(id: 55, name: AppStrings.Parameter.mainAttribute)
        case 56: return BaseParam(id: 56, name: AppStrings.Parameter.secondaryAttribute)
        case 57: return BaseParam(id: 57, name: AppStrings.Parameter.slowResistance)
        case 58: return BaseParam(id: 58, name: AppStrings.Parameter.petrificationResistance)
        case 59: return BaseParam(id: 59, name: AppStrings.Parameter.paralysisResistance)
        case 60: return BaseParam(id: 60, name: AppStrings.Parameter.silenceResistance)
        case 61: return BaseParam(id: 61, name: AppStrings.Parameter.blindResistance)
        case 62: return BaseParam(id: 62, name: AppStrings.Parameter.poisonResistance)
        case 63: return BaseParam(id: 63, name: AppStrings.Parameter.stunResistance)
        case 64: return BaseParam(id: 64, name: AppStrings.Parameter.sleepResistance)
        case 65: return BaseParam(id: 65, name: AppStrings.Parameter.bindResistance)
        case 66: return BaseParam(id: 66, name: AppStrings.Parameter.heavyResistance)
        case 67: return BaseParam(id: 67, name: AppStrings.Parameter.doomResistance)
        case 68: return BaseParam(id: 68, name: AppStrings.Parameter.reducedDurabilityLoss)
        case 69: return BaseParam(id: 69, name: AppStrings.Parameter.increasedSpiritbondGain)
        case 70: return BaseParam(id: 70, name: AppStrings.Parameter.craftsmanship)
        case 71: return BaseParam(id: 71, name: AppStrings.Parameter.control)
        case 72: return BaseParam(id: 72, name: AppStrings.Parameter.gathering)
        case 73: return BaseParam(id: 73, name: AppStrings.Parameter.perception)
        default: return BaseParam(id: 0, name: AppStrings.Parameter.unknown)
        }
    }
}
