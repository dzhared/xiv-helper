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

