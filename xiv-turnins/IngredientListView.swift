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
        NavigationStack {
            VStack {
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
                Section("Recipe") {
                    IngredientListView(recipeID: 2394)
                }
            }
        }
    }
}

