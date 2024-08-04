import XCTest

@testable import XIV_Helper

final class NodeTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var node: Node!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        node = .example
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        node = nil
    }

    /// The computed properties initialize correctly. As of 2.3.0 there are none.
    func testNodeComputedProperties() {
        // no-op
    }

    /// The Node encodes and decodes as expected.
    func testNodeEncodeDecode() throws {
        let encoded = try encoder.encode(node)
        let decoded = try decoder.decode(Node.self, from: encoded)
        XCTAssertEqual(decoded.id, node.id)
        XCTAssertEqual(decoded.items, node.items)
        XCTAssertEqual(decoded.limited, node.limited)
        XCTAssertEqual(decoded.level, node.level)
        XCTAssertEqual(decoded.type, node.type)
        XCTAssertEqual(decoded.legendary, node.legendary)
        XCTAssertEqual(decoded.ephemeral, node.ephemeral)
        XCTAssertEqual(decoded.spawns, node.spawns)
        XCTAssertEqual(decoded.duration, node.duration)
        XCTAssertEqual(decoded.zoneId, node.zoneId)
        XCTAssertEqual(decoded.radius, node.radius)
        XCTAssertEqual(decoded.x, node.x)
        XCTAssertEqual(decoded.y, node.y)
        XCTAssertEqual(decoded.z, node.z)
        XCTAssertEqual(decoded.map, node.map)
        XCTAssertEqual(decoded.mapName, node.mapName)
        XCTAssertEqual(decoded.hiddenItems, node.hiddenItems)
        XCTAssertEqual(decoded.patch, node.patch)
    }
}
