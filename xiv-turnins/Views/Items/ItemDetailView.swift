//
//  ItemDetailView.swift
//  xiv-turnins
//
//  Created by Jared on 4/7/23.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item: Item
    
    var body: some View {
        NavigationStack {
            List {
                // Title view with name, level, icon and class
                ItemTitleBadge(item: item)
                
                // Badge showing job icon, level and name
                ClassJobBadge(classJob: ClassJobCategory(equipClass: item.classJob.0), level: item.itemRecipeInfo[0].level)
                
                // Recipe details
                IngredientListView(recipeID: item.itemRecipeInfo[0].id)
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item.example)
    }
}
