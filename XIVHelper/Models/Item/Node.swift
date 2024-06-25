import SwiftData

/// Information on a gathering node.
struct Node: Codable, Identifiable, Equatable {

    /// The unique identifier for the node.
    let id: Int

    /// The IDs of items from this node.
    let items: [Int]

    /// Whether the node is limited.
    let limited: Bool

    /// The level of the node.
    let level: Int

    /// The ID of the type of gathering node.
    let type: Int

    /// Whether the node is legendary.
    let legendary: Bool

    /// Whether the node is ephemeral.
    let ephemeral: Bool

    /// TODO
    let spawns: [Int]

    /// TODO
    let duration: Int

    /// The ID of the zone the node is in.
    let zoneId: Int

    /// The radius of the node.
    let radius: Int

    /// The x-coordinate of the node.
    let x: Float

    /// The y-coordinate of the node.
    let y: Float

    /// The z-coordinate of the node.
    let z: Float

    /// The ID of the mat the node is in.
    let map: Int

    /// The localized name of the map the node is in.
    let mapName: LocalizedString

    /// The IDs of the hidden items from this node.
    let hiddenItems: [Int]

    /// The localized name of the zone.
    let name: LocalizedString

    /// The ID of the patch the node was introduced in.
    let patch: Int

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id &&
        lhs.zoneId == rhs.zoneId
    }

    // MARK: Example

    static let example = Node(
        id: 214,
        items: [4816, 7734],
        limited: true,
        level: 50,
        type: 2,
        legendary: true,
        ephemeral: false,
        spawns: [9],
        duration: 180,
        zoneId: 167,
        radius: 73,
        x: 30.7,
        y: 27.01,
        z: 0,
        map: 17,
        mapName: LocalizedString(en: "Eastern La Noscea"),
        hiddenItems: [10099, 10335],
        name: LocalizedString(en: "Bloodshore", ja: "ブラッドショア", de: "Rotgischt", fr: "Rives sanglantes", ko: "핏빛해안", zh: "鲜血滨"),
        patch: 2
    )
}
