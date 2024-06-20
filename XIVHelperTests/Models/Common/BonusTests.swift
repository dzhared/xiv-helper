import XCTest

@testable import XIV_Helper

final class BonusTests: XCTestCase {

    var bonus: Bonus!

    override func setUp() {
        bonus = Bonus(
            id: 46,
            nq: 8,
            hq: 10,
            max: 46,
            maxHQ: 58
        )
    }

    override func tearDown() {
        bonus = nil
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
}
