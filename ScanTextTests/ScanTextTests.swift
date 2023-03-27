//
//  ScanTextTests.swift
//  ScanTextTests
//
//  Created by Jared on 3/25/23.
//

import XCTest
@testable import xiv_turnins

final class ScanTextTests: XCTestCase {

    func testSampleImage() throws {
        let testImage = UIImage(named: "exampleImageFull")!
        let testText = scanText(image: testImage)
        
        XCTAssertTrue(!testText.1.isEmpty, "Failed to extract the following items: \(testText.1)")
    }
    
    func testRemovingCharacters() throws {
        // Simulate potential unusual text inputs
        let testInputs: [String] = [
            "Red Pine Cane",
            "* * Chondrite Cross-pein Hammer",
            "& Dwarven Mythril Chainmail of Maiming",
            "Ametrine Bracelet of Healing",
            "# Swallowskin Gloves of Healing",
            "AR-Caean Velvet Work Cap of Crafting",
            "Tincture of Strength",
            "• Sykon Bavarois"
        ]
        
        // Check if filtered strings are present in allItems array
        let filteredTestInputs = filterLines(unfilteredLines: testInputs)
        
        XCTAssertTrue(filteredTestInputs.1.isEmpty, "Failed to find items in allItems array: \(filteredTestInputs.1)")
    }
}
