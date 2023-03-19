//
//  ImageHandler.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

// TODO: Create array of strings from photo of turnin menu using Vision

// Use for testing without populating items list from scanText
let dummyData: [String] = [
    "Lignum Vitae Fishing Rod",     // 8  Carpenter      CRP
    "Dwarven Mythril Pickaxe",      // 9  Blacksmith     BSM
    "Dwarven Mythril Frypan",       // 10 Armorer        ARM
    "Dwarven Mythril Bracelets",    // 11 Goldsmith      GSM
    "Swallowskin Shoes",            // 12 Leatherworker  LTW
    "Dwarven Cotton Jacket",        // 13 Weaver         WVR
    "Tincture of Dexterity",        // 14 Alchemist      ALC
    "Lemonade"                      // 15 Culinarian     CUL
]

// UNUSED: for retrieving job acronyms by job ID number
func getJobAcronym(id: Int) -> (String, String) {
    switch id {
    case 8:
        return ("CRP", "Carpenter")
    case 9:
        return ("BSM", "Blacksmith")
    case 10:
        return ("ARM", "Armorer")
    case 11:
        return ("GSM", "Goldsmith")
    case 12:
        return ("LTW", "Leatherworker")
    case 13:
        return ("WVR", "Weaver")
    case 14:
        return ("ALC", "Alchemist")
    default:
        return ("CUL", "Culinarian")
    }
}
