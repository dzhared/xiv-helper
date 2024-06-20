/// The rewards for a Grand Company supply mission.
struct Supply: Codable {

    // MARK: Properties

    /// The quantity of the item needed.
    let amount: Int

    /// The quantity of class experience awarded.
    let xp: Int

    /// The quantity of Grand Company seals rewarded.
    let seals: Int

    /// The experience awarded if turning in HQ items.
    var xpHq: Int {
        xp * 2
    }

    /// The seals awarded if turning in HQ items.
    var sealsHq: Int {
        seals * 2
    }
}
