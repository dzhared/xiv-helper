/// The info about a leve for a given item.
struct Leve: Codable, Equatable {

    /// The id of the `leve`.
    let leve: Int

    /// The quantity of the item needed for the leve.
    let amount: Int

    /// The class level needed to participate in the leve.
    let lvl: Int

    /// The localized name of the leve.
    let name: LocalizedString

    /// The ID of the ClassJob needed to participate in the leve.
    let classJob: Int
}
