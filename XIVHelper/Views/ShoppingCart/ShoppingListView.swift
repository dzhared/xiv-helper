import SwiftUI
import SwiftData

/// Displays the ingredients to craft the recipes user has added to their crafting list.
struct ShoppingListView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// The recipes the user has saved.
    @Query private var userRecipes: [UserRecipe]

    /// The ingredients needed to craft everything.
    @State var ingredients: [Ingredient] = []

    // MARK: Body

    var body: some View {
        NavigationStack {
            List {
                ForEach(ingredients.sorted(by: { $0.id > $1.id }), id: \.id) { ingredient in
                    NavigationLink {
                        ItemDetailView(itemID: ingredient.id)
                    } label: {
                        ListBadgeView(ingredient: ingredient)
                    }
                }
            }
            .navigationTitle("Shopping List")
            .onAppear {
                generateShoppingList()
            }
        }
    }

    /// Generates a shopping list for the users and updates `ingredients`.
    private func generateShoppingList() {
        /// Iterate through user's saved recipes.
        for userRecipe in userRecipes {
            /// Determine how many items are needed for the given quantity.
            let recipeQuantity = userRecipe.quantity

            /// Iterate through ingredients for this recipe.
            for ingredient in userRecipe.recipe.ingredients {
                /// If the ingredient exists, update its quantity. If not, add this to the list.
                if var existingIngredient = ingredients.first(where: { $0.id == ingredient.id }) {
                    existingIngredient.quantity += (recipeQuantity * ingredient.quantity)
                } else {
                    var ingredientToAdd = ingredient
                    ingredientToAdd.quantity = (ingredient.quantity * recipeQuantity)
                    ingredients.append(ingredientToAdd)
                }
            }
        }
    }
}

// MARK: Previews

#Preview("Not Empty") {
    ShoppingListView(
        ingredients: [
            Ingredient(
                id: 28176,
                ingredientItemIcon: "/i/025000/025597_hr1.png",
                name: LocalizedString(en: "Red Campanulas"),
                quantity: 4
            ),
            Ingredient(
                id: 12609,
                ingredientItemIcon: "/i/022000/022609_hr1.png",
                name: LocalizedString(en: "Bear Fat"),
                quantity: 4
            ),
            Ingredient(
                id: 12631,
                ingredientItemIcon: "/i/022000/022614_hr1.png",
                name: LocalizedString(en: "Dravanian Spring Water"),
                quantity: 4
            ),
            Ingredient(
                id: 13,
                ingredientItemIcon: "/i/020000/020008_hr1.png",
                name: LocalizedString(en: "Water Crystal"),
                quantity: 20
            ),
            Ingredient(
                id: 12,
                ingredientItemIcon: "/i/020000/020011_hr1.png",
                name: LocalizedString(en: "Lightning Crystal"),
                quantity: 16
            )
        ]
    )
    .modelContainer(previewContainer)
}

#Preview("Empty") {
    ShoppingListView(ingredients: [])
        .modelContainer(previewContainer)
}
