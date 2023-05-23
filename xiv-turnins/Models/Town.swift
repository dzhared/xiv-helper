//
//  Town.swift
//  xiv-turnins
//
//  Created by Jared on 5/22/23.
//

import Foundation

struct Town: Codable, Identifiable {
    let id: Int
    let iconHd: String
    let name: String
    
    static let example: Town = Town(id: 1, iconHd: "/i/060000/060881_hr1.png", name: "Limsa Lominsa")
}
