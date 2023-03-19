//
//  TextIdentifier.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI
import Vision

func scanText(imageName: String) -> [String] {
    // Create text recognition request
    let request = VNRecognizeTextRequest()
    
    // Configure recognition request
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = false
    
    // Create an image request handler
    guard let image = UIImage(named: imageName),
          let cgImage = image.cgImage else {
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
    return lines
}

