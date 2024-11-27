import XCTest

@testable import XIV_Helper

final class ClassJobTests: XCTestCase {

    var classJob: ClassJob!

    override func setUp() {
        super.setUp()

        // Set up inside each test
    }

    override func tearDown() {
        super.tearDown()

        classJob = nil
    }

    /// A known ID initializes a `ClassJob` correctly.
    func testClassJobFromId() {
        /// Initialize with a known ID.
        classJob = ClassJob(id: 10)
        XCTAssertEqual(classJob.id, 10)
        XCTAssertEqual(classJob.name, "Armorer")
        XCTAssertEqual(classJob.abbreviation, "ARM")

        /// An unknown ID returns a default value.
        classJob = ClassJob(id: 300)
        XCTAssertEqual(classJob.id, 0)
        XCTAssertEqual(classJob.name, "Adventurer")
        XCTAssertEqual(classJob.abbreviation, "ADV")

        /// Test Dawntrail classes.
        classJob = ClassJob(id: 41)
        XCTAssertEqual(classJob.id, 41)
        XCTAssertEqual(classJob.name, "Viper")
        XCTAssertEqual(classJob.abbreviation, "VPR")

        classJob = ClassJob(id: 42)
        XCTAssertEqual(classJob.id, 42)
        XCTAssertEqual(classJob.name, "Pictomancer")
        XCTAssertEqual(classJob.abbreviation, "PCT")
    }
}
