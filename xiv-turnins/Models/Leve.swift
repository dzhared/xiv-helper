//
//  Leve.swift
//  xiv-turnins
//
//  Created by Jared on 5/22/23.
//

import Foundation

struct Leve: Codable, Identifiable {
    let allowanceCost: Int
    let classJobCategory: ClassJobCategory
    let classJobLevel: Int
    let description: String
    let expFactor: Int
    let expReward: Int
    let id: Int
    let leveClient: LeveClient
    let town: Town
    
    static let example: Leve = Leve(
        allowanceCost: 1,
        classJobCategory: ClassJobCategory.example,
        classJobLevel: 30,
        description: "There is no better customer than an elderly Ul'dahn. Forget what you've heard about the wonders of the afterlife, these well-to-dos seek only to extend their stay in Nald's realm that they might revel in its pleasures. For them, possession is power, money is never an object, and senility sees that they keep coming back for more. Take, for example, Wanderer's Blood. As useless as snake oil, and twice as foul, but its rarity has transformed it into a must-have item here in Costa del Sol. And when there is demand, it is only natural to provide a supply. If you are willing to assist my establishment in gathering the Oschon roselle calyces needed to give the tincture its color, I would be more than happy to give you a cut of my profits.",
        expFactor: 101,
        expReward: 0,
        id: 700,
        leveClient: LeveClient.example,
        town: Town.example)
}

struct LeveClient: Codable {
    let id: Int
    let name: String
    
    static let example: LeveClient = LeveClient(id: 65, name: "Client: Flying Shark Proprietor, Dyrstweitz the Daft")
}
