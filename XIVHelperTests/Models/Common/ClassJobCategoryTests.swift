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
        XCTAssertEqual(classJobCategory.classJobs.count, 41)
    }

    /// TODO: This fails because the IDs in ClassJobCategory.swift are off by one.
    func testClassJobCategoryWithMultipleClassJobs() {
        /// Initialize with a known ID for `GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD WAR DRK`.
        classJobCategory = ClassJobCategory(id: 37)
        XCTAssertEqual(classJobCategory.name, "GLA PGL MRD LNC ARC ROG CNJ THM ACN PLD WAR DRK")

        let abbreviations = classJobCategory.name.split(separator: " ")
        XCTAssertEqual(classJobCategory.classJobs.count, abbreviations.count)
        for abbreviation in abbreviations {
            XCTAssertTrue(classJobCategory.classJobs.contains(where: { classJob in
                classJob.abbreviation == abbreviation
            }))
        }
    }
}
