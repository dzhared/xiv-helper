import SwiftUI

// MARK: - IngredientList

struct IngredientList: View {
    
    // MARK: Properties
    
    /// The recipe to be displayed. Must be wrapped as `@State` to enable `getRecipe`.
    @State var recipe: Recipe?
    
    /// The identifier for the `Recipe`.
    let recipeID: Int
    
    // MARK: Body
    
    var body: some View {
        Section("Recipe") {
            ParameterGrid(recipe: recipe ?? .example)
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

// MARK: - PreviewProvider

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                IngredientList(recipeID: 2394)
            }
        }
    }
}

