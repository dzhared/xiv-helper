//
//  FileManager-DocumentsDirectory.swift
//  xiv-turnins
//
//  Created by Jared on 4/23/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
