import XCTest

@testable import XIV_Helper

final class ClassJobCategoryTests: XCTestCase {

    var classJobCategory: ClassJobCategory!

    override func setUp() {
        // Set up inside each test
    }

    override func tearDown() {
        classJobCategory = nil
    }

    /// A known ID initializes a `ClassJobCategory` correctly.
    func testClassJobCategoryFromId() {
        /// Initialize with a known ID.
        classJobCategory = ClassJobCategory(id: 1)
        XCTAssertEqual(classJobCategory.name, "All Classes")
        XCTAssertEqual(classJobCategory.id, 1)
        XCTAssertEqual(classJobCategory.classJobs.count, 43)
    }

    /// Initializing a ClassJobCategory returns the expected ClassJobs and matching abbreviations.
    func testClassJobCategoryWithMultipleClassJobs() {
        /// Initialize with a known ID of multiple abbreviations.
        classJobCategory = ClassJobCategory(id: 37)
        XCTAssertEqual(classJobCategory.name, "GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD WAR DRK")

        /// The number of abbreviations is equal to the number of ClassJob objects.
        let abbreviations = classJobCategory.name.split(separator: " ")
        XCTAssertEqual(classJobCategory.classJobs.count, abbreviations.count)

        /// Each abbreviation matches a ClassJob.
        for abbreviation in abbreviations {
            XCTAssertTrue(classJobCategory.classJobs.contains(where: { classJob in
                classJob.abbreviation == ClassJob(acronym: String(abbreviation)).abbreviation
            }))
        }

        /// Initialize with a broader name.
        classJobCategory = ClassJobCategory(id: 35)
        XCTAssertEqual(classJobCategory.name, "Disciples of the Land or Hand")
        var expected: [ClassJob] = [
            // Disciples of the Hand
            "CRP", "BSM", "ARM", "GSM", "LTW", "WVR", "ALC", "CUL",
            // Disciples of the Land
            "MIN", "BTN", "FSH",
        ].map { ClassJob(acronym: $0) }
        XCTAssertEqual(classJobCategory.classJobs.count, expected.count)

        /// Test Dawntrail examples.
        /// Various jobs, including Viper.
        classJobCategory = ClassJobCategory(id: 103)
        XCTAssertEqual(classJobCategory.name, "ROG NIN VPR")
        expected = [
            "ROG", "NIN", "VPR"
        ].map { ClassJob(acronym: $0) }
        XCTAssertEqual(classJobCategory.classJobs.count, expected.count)

        /// Various jobs, including Pictomancer.
        classJobCategory = ClassJobCategory(id: 116)
        XCTAssertEqual(classJobCategory.name, "THM ACN BLM SMN RDM BLU PCT")
        expected = [
            "THM", "ACN", "BLM", "SMN", "RDM", "BLU", "PCT"
        ].map { ClassJob(acronym: $0) }
        XCTAssertEqual(classJobCategory.classJobs.count, expected.count)

        /// Viper only.
        classJobCategory = ClassJobCategory(id: 196)
        XCTAssertEqual(classJobCategory.name, "VPR")
        XCTAssertEqual(classJobCategory.classJobs, [ClassJob(id: 41)])

        /// Pictomancer only.
        classJobCategory = ClassJobCategory(id: 197)
        XCTAssertEqual(classJobCategory.name, "PCT")
        XCTAssertEqual(classJobCategory.classJobs, [ClassJob(id: 42)])
    }
}
