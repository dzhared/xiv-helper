//
//  ItemDetailView.swift
//  xiv-turnins
//
//  Created by Jared on 4/7/23.
//

import SwiftUI

// TODO: Format ItemDetailView screen

struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        NavigationStack {
            List {
                Section("Item") {
                    Text(item.name)
//                    Text(String(item.id))
                    AsyncImage(url: URL(string: "https://xivapi.com\(item.icon)"))
                    Text(String(item.levelEquip))
                    Text(String(item.levelItem))
                }
                
                Section("Recipe") {
                    Text(String(item.itemRecipeInfo[0].id))
                    Text(String(item.itemRecipeInfo[0].level))
                    Text(String(item.itemRecipeInfo[0].classJobID))
                }
                
                if let equipClass = item.classJobCategory.equipClass {
                    Section("Equip Class") {
                        Text(equipClass)
                    }
                }
                
                Section("Recipe") {
                    IngredientListView(recipeID: item.itemRecipeInfo[0].id)
                }
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(
            classJobCategory: Item.ClassJobCategory(equipClass: "All Classes"),
            id: 11979,
            icon: "/i/046000/046540_hr1.png",
            levelEquip: 53,
            levelItem: 80,
            name: "Holy Rainbow Shoes",
            itemRecipeInfo: [Item.ItemRecipeInfo(classJobID: 13, id: 2747, level: 54)]))
    }
}
