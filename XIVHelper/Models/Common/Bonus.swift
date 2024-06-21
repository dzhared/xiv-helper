/// Bonus stats for consumable items.
struct Bonus: Codable, Equatable {

    // MARK: Properties

    /// The parameter to be boosted.
    let id: Int

    /// The amount to boost the value for a NQ item.
    let nq: Int

    /// The amount to boost the value for a HQ item, if possible.
    let hq: Int?

    /// The maximum bonus with a NQ item.
    let max: Int?

    /// The maximum bonus with a HQ item, if possible.
    let maxHQ: Int?

    /// The parameter being boosted.
    var baseParam: BaseParam {
        BaseParam(id: id)
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case nq = "NQ"
        case hq = "HQ"
        case max = "Max"
        case maxHQ = "MaxHQ"
    }
}
