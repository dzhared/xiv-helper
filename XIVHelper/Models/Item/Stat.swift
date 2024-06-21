/// The stats for an item, with both NQ and HQ values as well as the corresponding `BaseParam`.
struct Stat: Codable, Equatable {

    // MARK: Properties

    /// The BaseParam ID for the stat.
    let id: Int

    /// The NQ value for the stat.
    let nq: Int

    /// The optional HQ value for the stat.
    let hq: Int?

    /// The name of the stat.
    var baseParam: BaseParam {
        BaseParam(id: self.id)
    }

    /// The difference between an HQ value and NQ value. Used for display.
    var hqBonus: Int? {
        if let hq {
            return hq - nq
        }
        return nil
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case nq = "NQ"
        case hq = "HQ"
    }
}
