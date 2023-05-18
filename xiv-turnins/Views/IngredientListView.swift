//
//  RecipeView.swift
//  xiv-turnins
//
//  Created by Jared on 3/28/23.
//

import SwiftUI

struct IngredientListView: View {
    
    @State var recipe: Recipe?
    let recipeID: Int
    
    var body: some View {
        Section("Stats") {
            Text("Difficulty: ") + Text(String(recipe?.difficulty ?? 0)).font(.headline)
            Text("Durability: ") + Text(String(recipe?.durability ?? 0)).font(.headline)
            Text("Suggested Craftsmanship: ") + Text(String(recipe?.suggestedCraftsmanship ?? 0)).font(.headline)
            Text("Suggested Control: ") + Text(String(recipe?.suggestedControl ?? 0)).font(.headline)
        }
        
        Section("Recipe") {
            VStack(alignment: .leading) {
                ForEach(recipe?.ingredients ?? [], id: \.id) { ingredient in
                    IngredientBadge(ingredient: ingredient)
                }
            }
        }
        .onAppear {
            getRecipe(recipeID: recipeID) { fetchedRecipe in
                recipe = fetchedRecipe
            }
        }
    }
}


struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                IngredientListView(recipeID: 2394)
            }
        }
    }
}

