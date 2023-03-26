//
//  DeliverableTests.swift
//  DeliverableTests
//
//  Created by Jared on 3/25/23.
//

import XCTest
@testable import xiv_turnins

final class DeliverableTests: XCTestCase {

    func testGetDeliverable() throws {
        let expectedName = "Holy Rainbow Shoes"
        let expectedID = 11979
        let expectedIcon = "/i/046000/046540.png"
        let expectedRecipe = 2747
        
        let expectation = XCTestExpectation(description: "Completion handler called")
        
        getDeliverable(itemName: "Holy Rainbow Shoes") { deliverable in
            XCTAssertNotNil(deliverable)
            XCTAssertEqual(deliverable?.name, expectedName)
            XCTAssertEqual(deliverable?.id, expectedID)
            XCTAssertEqual(deliverable?.icon, expectedIcon)
            XCTAssertEqual(deliverable?.recipe, expectedRecipe)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

}
