import SwiftUI
import SwiftData

/// Displays the ingredients to craft the recipes user has added to their crafting list.
struct ShoppingListView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// The shared SettingsManager instance.
    @ObservedObject private var settings = SettingsManager.shared

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
            .navigationTitle(AppStrings.Navigation.shoppingList)
            .onAppear {
                generateShoppingList()
            }
            .onChange(of: settings.baseMaterials) {
                generateShoppingList()
            }
            .toolbar {
                // Display sort options
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Toggle(AppStrings.ShoppingList.baseMaterials, isOn: settings.$baseMaterials)
                    } label: {
                        Label(AppStrings.General.settings, systemImage: "ellipsis.circle")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
        }
    }

    // MARK: Private Methods

    /// Whether the item can be crafted. Does not query for an actual recipe for performance.
    private func canBeCrafted(_ itemId: Int) -> Bool {
        let descriptor = FetchDescriptor<Recipe>(
            predicate: #Predicate<Recipe> {
                $0.resultId == itemId
            }
        )
        let count = try? context.fetchCount(descriptor)
        return (count ?? 0) > 0
    }

    /// Checks if an item can be crafted, and if so, returns its first `Recipe`.
    ///
    /// - Parameter itemId: The ID of the item to be checked.
    /// - Returns: The first Recipe found for that item.
    ///
    private func getRecipeFromItemId(_ itemId: Int) -> Recipe? {
        /// Retrieve first found recipe
        var descriptor = FetchDescriptor<Recipe>(
            predicate: #Predicate<Recipe> {
                $0.resultId == itemId
            }
        )
        descriptor.fetchLimit = 1
        let fetchedRecipe = try? context.fetch(descriptor).first

        /// Return optional recipe or `nil` if none was found.
        return fetchedRecipe
    }

    /// Checks if a given array of Ingredient objects contains any items that can be crafted.
    ///
    /// - Returns: Whether any craftable ingredients exist.
    ///
    private func ingredientsContainCraftable() -> Bool {
        for ingredient in ingredients {
            if canBeCrafted(ingredient.id) {
                return true
            }
        }
        return false
    }

    /// Iterates through all saved ingredients,
    private func getBaseIngredients() {
        // Iterate while ingredients list contains craftable items
        while ingredientsContainCraftable() {
            // Check each ingredient, and if any are craftable, add to list
            for ingredient in self.ingredients.filter({ canBeCrafted($0.id) }) {
                // Factor to multiply by to reflect needed quantities
                let ingredientQuantity = ingredient.quantity

                // Remove ingredient from list
                if let index = ingredients.firstIndex(of: ingredient) {
                    ingredients.remove(at: index)
                }

                // Replace or update quantity
                if let subRecipe = getRecipeFromItemId(ingredient.id) {
                    for ingredient in subRecipe.ingredients {
                        if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
                            ingredients[index].quantity += (ingredient.quantity * ingredientQuantity)
                        } else {
                            var ingredientToAdd = ingredient
                            ingredientToAdd.quantity = ingredient.quantity * ingredientQuantity
                            ingredients.append(ingredientToAdd)
                        }
                    }
                }
            }
        }
    }

    /// Generates a shopping list for the users and updates `ingredients`.
    private func generateShoppingList() {
        ingredients = []
        /// Iterate through user's saved recipes.
        for userRecipe in userRecipes {
            /// Determine how many items are needed for the given quantity.
            let recipeQuantity = userRecipe.quantity

            /// Iterate through ingredients for this recipe.
            for ingredient in userRecipe.recipe.ingredients {
                /// If the ingredient exists, update its quantity. If not, add this to the list.
                if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
                    ingredients[index].quantity += (ingredient.quantity * recipeQuantity)
                } else {
                    var ingredientToAdd = ingredient
                    ingredientToAdd.quantity = (ingredient.quantity * recipeQuantity)
                    ingredients.append(ingredientToAdd)
                }
            }
        }
        if settings.baseMaterials {
            getBaseIngredients()
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
