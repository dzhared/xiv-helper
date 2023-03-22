//
//  TextIdentifier.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI
import PhotosUI
import Vision

func scanText(image: UIImage) -> [String] {
    // Create text recognition request
    let request = VNRecognizeTextRequest()
    
    // Configure recognition request
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = false
    
    // Create an image request handler and ensure UIImage can convert to CGImage
    guard let cgImage = image.cgImage else {
        return []
    }
    let handler = VNImageRequestHandler(cgImage: cgImage)
    
    // Perform recognition request
    try? handler.perform([request])
    
    // Extract recognized text
    guard let observations = request.results else {
        return []
    }
    let recognizedText = observations
        .compactMap { observation in
            return observation.topCandidates(1).first?.string
        }
        .joined(separator: "\n")
    
    // Split recognized text into array of strings
    let lines = recognizedText.components(separatedBy: .newlines).filter { !$0.isEmpty }
    print(lines)
    let filteredArray = lines
        .map { $0.replacingOccurrences(of: "• ", with: "").replacingOccurrences(of: ", ", with: "") }
        .filter { allItems.contains($0) }
    return filteredArray
}

