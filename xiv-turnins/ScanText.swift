//
//  TextIdentifier.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI
import PhotosUI
import Vision

func scanText(image: UIImage) -> ([String], [String]) {
    // Create text recognition request
    let request = VNRecognizeTextRequest()
    
    // Configure recognition request
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = false
    
    // Create an image request handler and ensure UIImage can convert to CGImage
    guard let cgImage = image.cgImage else {
        return ([], [])
    }
    let handler = VNImageRequestHandler(cgImage: cgImage)
    
    // Perform recognition request
    try? handler.perform([request])
    
    // Extract recognized text
    guard let observations = request.results else {
        return ([], [])
    }
    let recognizedText = observations
        .compactMap { observation in
            return observation.topCandidates(1).first?.string
        }
        .joined(separator: "\n")
    
    // Split recognized text into array of strings
    let allLines = recognizedText.components(separatedBy: .newlines).filter { !$0.isEmpty }
    let lines = filterLines(unfilteredLines: allLines)
    
    return lines
}
    
func filterLines(unfilteredLines: [String]) -> ([String], [String]) {
    // Define possible extraneous characters to be filtered
    let patterns = ["• ", ", ", "* ", "# ", ") ", "^ ", "& "]
    
    // Filter out extraneous characters
    var filteredLines: [String] = []
    var unmatchedLines: [String] = []
    
    for line in unfilteredLines {
        var filteredLine = line
        for pattern in patterns {
            filteredLine = filteredLine.replacingOccurrences(of: pattern, with: "")
        }
        if allItems.contains(filteredLine) {
            filteredLines.append(filteredLine)
        } else {
            unmatchedLines.append(filteredLine)
        }
    }
    
    return (filteredLines, unmatchedLines)
}

func matchTruncatedString(_ truncatedString: String) -> String {
    if allItems.contains(truncatedString) {
        return truncatedString
    }
    
    for item in allItems {
        if item.contains(truncatedString.replacingOccurrences(of: "...", with: "")) {
            return item
        }
    }
    
    // TODO: Throw an error?
    return truncatedString
}
