import SwiftUI
import SwiftData

struct IngredientsListBuilder {

    var context: ModelContext

    // MARK: Methods

    @MainActor func buildIngredientsList(from ingredients: [Ingredient]) -> [Ingredient] {
        // Create modifiable array from initial ingredients array
        var newIngredients = ingredients
        // Iterate until all ingredients are base ingredients
        while ingredientsContainCraftable(newIngredients) {
            for ingredient in newIngredients {

                // Store quantity to apply to new materials
                let existingQuantity = ingredient.quantity

                // If craftable, get its recipe and add/update its ingredients
                if canBeCrafted(ingredient.id), let newRecipe = getRecipeFromItemId(ingredient.id) {
                    // Remove this item from newIngredients to replace it with sub-ingredients
                    if let index = newIngredients.firstIndex(of: ingredient) {
                        newIngredients.remove(at: index)
                    }

                    // Iterate through sub-recipe's ingredients
                    for ingredient in newRecipe.ingredients {
                        // Prepare modifiable ingredient
                        var ingredientToAdd = ingredient

                        // Update quantity to match quantity of recipe in shopping list
                        ingredientToAdd.quantity = ingredientToAdd.quantity * existingQuantity

                        // If this item is already in the ingredients, update the quantity. If not, add it.
                        if let index = newIngredients.firstIndex(where: { $0.id == ingredient.id }) {
                            newIngredients[index].quantity += ingredientToAdd.quantity
                        } else {
                            newIngredients.append(ingredientToAdd)
                        }
                    }
                }
            }
        }

        return newIngredients
    }

    // MARK: Private Methods

    /// Whether the item can be crafted. Does not query for an actual recipe for performance.
    @MainActor private func canBeCrafted(_ itemId: Int) -> Bool {
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
    @MainActor private func getRecipeFromItemId(_ itemId: Int) -> Recipe? {
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
    @MainActor private func ingredientsContainCraftable(_ ingredients: [Ingredient]) -> Bool {
        for ingredient in ingredients {
            if canBeCrafted(ingredient.id) {
                return true
            }
        }
        return false
    }
}
