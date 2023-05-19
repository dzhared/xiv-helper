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
        Section("Recipe") {
            HStack(alignment: .top) {
                VStack {
                    Text("Difficulty")
                        .font(.caption.bold())
                    Text(String(recipe?.difficulty ?? 0))
                        .font(.title3)
                }
                Spacer()
                VStack {
                    Text("Durability")
                        .font(.caption.bold())
                    Text(String(recipe?.durability ?? 0))
                        .font(.title3)
                }
                Spacer()
                VStack {
                    Text("Craftsmanship")
                        .font(.caption.bold())
                    Text(String(recipe?.suggestedCraftsmanship ?? 0))
                        .font(.title3)
                }
                Spacer()
                VStack {
                    Text("Control")
                        .font(.caption.bold())
                    Text(String(recipe?.suggestedControl ?? 0))
                        .font(.title3)
                }
            }
            .multilineTextAlignment(.center)
            
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

