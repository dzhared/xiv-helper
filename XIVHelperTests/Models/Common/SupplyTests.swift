import XCTest

@testable import XIV_Helper

final class SupplyTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var supply: Supply!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        supply = Supply(amount: 3, xp: 1_300_000, seals: 5_000)
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        supply = nil
    }

    /// The `Supply` encodes and decodes as expected.
    func testSupplyEncodeDecode() throws {
        let encoded = try encoder.encode(supply)
        let decoded = try decoder.decode(Supply.self, from: encoded)
        XCTAssertEqual(decoded, supply)
    }

    /// The HQ turnins yield double XP and seals.
    func testHqDoublesXpAndSeals() {
        XCTAssertEqual(supply.seals * 2, supply.sealsHq)
        XCTAssertEqual(supply.xp * 2, supply.xpHq)
    }
}
