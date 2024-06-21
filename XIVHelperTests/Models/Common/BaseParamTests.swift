import XCTest

@testable import XIV_Helper

final class BaseParamTests: XCTestCase {

    var baseParam: BaseParam!

    override func setUp() {
        baseParam = BaseParam(id: 1)
    }

    override func tearDown() {
        baseParam = nil
    }

    /// Initializing a `BaseParam` from an `id` returns the correct name, or unknown if invalid.
    func testBaseParamInit() {
        XCTAssertEqual(baseParam.name, "Strength")
        XCTAssertEqual(baseParam.id, 1)

        baseParam = BaseParam(id: 2)
        XCTAssertEqual(baseParam.name, "Dexterity")
        XCTAssertEqual(baseParam.id, 2)

        baseParam = BaseParam(id: 3)
        XCTAssertEqual(baseParam.name, "Vitality")
        XCTAssertEqual(baseParam.id, 3)

        baseParam = BaseParam(id: 73)
        XCTAssertEqual(baseParam.name, "Perception")
        XCTAssertEqual(baseParam.id, 73)

        /// An unknown index returns an unknown BaseParam.
        baseParam = BaseParam(id: 100)
        XCTAssertEqual(baseParam.name, "Unknown")
        XCTAssertEqual(baseParam.id, 0)
    }
}
