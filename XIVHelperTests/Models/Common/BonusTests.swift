import XCTest

@testable import XIV_Helper

final class BonusTests: XCTestCase {

    var bonus: Bonus!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!

    override func setUp() {
        bonus = Bonus(
            id: 46,
            nq: 8,
            hq: 10,
            max: 46,
            maxHQ: 58
        )
        decoder = JSONDecoder()
        encoder = JSONEncoder()
    }

    override func tearDown() {
        bonus = nil
        decoder = nil
        encoder = nil
    }

    /// The BaseParam of the Bonus is initialized using its `id`.
    func testBonusBaseParam() {
        let expectedBaseParam = BaseParam(id: 46)
        XCTAssertEqual(bonus.baseParam.id, expectedBaseParam.id)
        XCTAssertEqual(bonus.baseParam.name, expectedBaseParam.name)
    }

    /// The CodingKeys raw values are as expected.
    func testBonusCodingKeys() {
        XCTAssertEqual(Bonus.CodingKeys.hq.rawValue, "HQ")
        XCTAssertEqual(Bonus.CodingKeys.id.rawValue, "ID")
        XCTAssertEqual(Bonus.CodingKeys.max.rawValue, "Max")
        XCTAssertEqual(Bonus.CodingKeys.maxHQ.rawValue, "MaxHQ")
        XCTAssertEqual(Bonus.CodingKeys.nq.rawValue, "NQ")
    }

    /// The `Bonus` encodes and decodes as expected.
    func testBonusEncodeDecode() throws {
        let encoded = try encoder.encode(bonus)
        let decoded = try decoder.decode(Bonus.self, from: encoded)
        XCTAssertEqual(decoded, bonus)
    }
}
