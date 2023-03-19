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
    let image = UIImage(named: imageName)!
    let handler = VNImageRequestHandler(cgImage: image.cgImage!)
    
    // Perform recognition request
    try? handler.perform([request])
    
    // Extract recognized text
    var recognizedText = ""
    guard let observations = request.results else { return [String]() }
    for observation in observations {
        guard let topCandidate = observation.topCandidates(1).first else { continue } // Why (1) and not (0)?
        recognizedText += (topCandidate.string + "\n")
    }
    
    // Split recognized text into array of strings
    let lines = recognizedText.components(separatedBy: .newlines)
    let nonEmptyLines = lines.filter { !$0.isEmpty }
    return nonEmptyLines
}
