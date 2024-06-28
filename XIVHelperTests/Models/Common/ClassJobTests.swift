import XCTest

@testable import XIV_Helper

final class ClassJobTests: XCTestCase {

    var classJob: ClassJob!

    override func setUp() {
        // Set up inside each test
    }

    override func tearDown() {
        classJob = nil
    }

    /// A known acronym initializes a `ClassJob` correctly.
    func testClassJobFromAcronym() {
        /// Initialize with a known acronym.
        classJob = ClassJob(acronym: "GNB")
        XCTAssertEqual(classJob.id, 37)
        XCTAssertEqual(classJob.name, "Gunbreaker")
        XCTAssertEqual(classJob.abbreviation, "GNB")

        /// The initializer is case-sensitive and will return a default value if not capitalized.
        classJob = ClassJob(acronym: "brd")
        XCTAssertEqual(classJob.id, 0)
        XCTAssertEqual(classJob.name, "Adventurer")
        XCTAssertEqual(classJob.abbreviation, "ADV")

        /// An unknown acronym returns a default value.
        classJob = ClassJob(acronym: "SYS")
        XCTAssertEqual(classJob.id, 0)
        XCTAssertEqual(classJob.name, "Adventurer")
        XCTAssertEqual(classJob.abbreviation, "ADV")

        /// Test Dawntrail classes.
        classJob = ClassJob(acronym: "VPR")
        XCTAssertEqual(classJob.id, 41)
        XCTAssertEqual(classJob.name, "Viper")
        XCTAssertEqual(classJob.abbreviation, "VPR")

        classJob = ClassJob(acronym: "PCT")
        XCTAssertEqual(classJob.id, 42)
        XCTAssertEqual(classJob.name, "Pictomancer")
        XCTAssertEqual(classJob.abbreviation, "PCT")
    }

    /// An `AllClassJob` enum initializes a `ClassJob` correctly.
    func testClassJobFromEnum() {
        /// An enum case initializes the correct `ClassJob`.
        classJob = ClassJob(classJob: .whm)
        XCTAssertEqual(classJob.id, 24)
        XCTAssertEqual(classJob.name, "White Mage")
        XCTAssertEqual(classJob.abbreviation, "WHM")

        /// Test Dawntrail classes.
        classJob = ClassJob(classJob: .vpr)
        XCTAssertEqual(classJob.id, 41)
        XCTAssertEqual(classJob.name, "Viper")
        XCTAssertEqual(classJob.abbreviation, "VPR")

        classJob = ClassJob(classJob: .pct)
        XCTAssertEqual(classJob.id, 42)
        XCTAssertEqual(classJob.name, "Pictomancer")
        XCTAssertEqual(classJob.abbreviation, "PCT")
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
