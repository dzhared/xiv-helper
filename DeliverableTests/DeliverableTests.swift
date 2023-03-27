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
        // Test whether XIVAPI returns expected deliverable
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
    
    func testGetDeliverablePerformance() {
        // Measure time taken to retrieve item data from XIVAPI
        let sampleItems: [String] = [
            "Lignum Vitae Fishing Rod",
            "Dwarven Mythril Pickaxe",
            "Dwarven Mythril Frypan",
            "Dwarven Mythril Bracelets",
            "Swallowskin Shoes",
            "Dwarven Cotton Jacket",
            "Tincture of Dexterity",
            "Lemonade"
        ]
        
        let expectation = XCTestExpectation(description: "All items retrieved")
        
        let startTime = DispatchTime.now()
        var itemsRetrieved = 0
        
        for item in sampleItems {
            getDeliverable(itemName: item) { item in
                let endTime = DispatchTime.now()
                let timeDelta = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
                print("Time to retrieve \(item?.name ?? "item"): \(Double(timeDelta) / Double(1_000_000)) ms")
                
                itemsRetrieved += 1
                if itemsRetrieved == sampleItems.count {
                    expectation.fulfill()
                }
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }



    
}
