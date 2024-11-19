import SwiftUI
import SwiftData

/// Displays information about a given recipe, and allows the user to add it to their shopping cart.
struct RecipeDetailView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// Whether the quantity selector is showing.
    @State private var isShowingQuantitySelector = false

    /// The number of the item selected.
    @State private var quantitySelected: Int = 0

    /// The optional recipe to be fetched upon loading the view.
    @State private var recipe: Recipe?

    /// Factor for display purposes, equivalent to the recipe's yield.
    private var displayQuantityFactor: Int {
        recipe?.yields ?? 1
    }

    /// Quantity for display purposes.
    var displayQuantity: Int {
        quantitySelected * displayQuantityFactor
    }

    /// The given ID for the recipe to be fetched.
    let recipeID: Int

    // MARK: Body

    var body: some View {
        NavigationStack {
            if let recipe, let item = recipe.resultItem {
                List {
                    // Primary information
                    Section("Result") {
                        NavigationLink {
                            ItemDetailView(item: item)
                        } label: {
                            ItemTitleBadgeView(recipe: recipe)
                        }
                        HStack {
                            Image(recipe.classJob.abbreviation)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 36)
                            Text("Level \(recipe.classJobLevel) \(recipe.classJob.name)")
                                .font(.headline)
                        }
                        VStack(alignment: .leading) {
                            Text("**Can\(recipe.canHq ? "" : "not")** be HQ")
                            Text("**Can\(recipe.canQs ? "" : "not")** be quick synthesized")
                        }
                        ParameterGrid(recipe: recipe)
                    }

                    // Master recipe information
                    if let name = recipe.masterbookName,
                       let icon = recipe.masterbookIcon {
                        Section("Master Recipe") {
                            ListBadgeView(
                                icon: icon,
                                name: name,
                                quantity: nil,
                                subtitle: nil
                            )
                        }
                    }

                    // Ingredients list
                    Section("Ingredients") {
                        ForEach(recipe.ingredients, id: \.id) { ingredient in
                            NavigationLink {
                                ItemDetailView(itemID: ingredient.id)
                            } label: {
                                ListBadgeView(ingredient: ingredient)
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingQuantitySelector) {
                    quantitySelector()
                        .presentationDetents([.height(200)])
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        addRecipeButton()
                    }
                }
                .navigationTitle(AppStrings.Navigation.recipeDetail)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            fetchRecipe()
            updateQuantitySelected()
        }
    }

    // MARK: Private Methods

    /// Fetches the recipe from the recipe ID, if not already loaded.
    private func fetchRecipe() {
        /// Do not load if recipe is already loaded.
        guard recipe == nil else { return }

        /// Retrieve the recipe.
        var descriptor = FetchDescriptor<Recipe>(
            predicate: #Predicate { $0.id == recipeID }
        )
        descriptor.fetchLimit = 1

        do {
            /// Attempt to assign to `recipe`.
            let fetchedRecipes = try context.fetch(descriptor)
            recipe = fetchedRecipes.first
        } catch {
            recipe = nil
        }
    }

    /// Updates `quantitySelected`, the state variable for the view.
    private func updateQuantitySelected() {
        /// Fetch the `UserRecipe` item, if it exists, from the SwiftData context.
        let descriptor = FetchDescriptor<UserRecipe>(predicate: #Predicate { $0.recipe.id == recipeID })
        guard let fetchedUserRecipe = try? context.fetch(descriptor).first else { return }

        /// Assign the existing item's quantity to the view's state variable.
        quantitySelected = fetchedUserRecipe.quantity

        try? context.save()
    }

    /// Updates the recipe's `quantity` in the SwiftData context.
    private func updateSwiftDataQuantity() {
        /// Fetch the `UserRecipe` item, if it exists, from the SwiftData context.
        let descriptor = FetchDescriptor<UserRecipe>(predicate: #Predicate { $0.recipe.id == recipeID })
        guard let fetchedUserRecipe = try? context.fetch(descriptor).first else { return }

        /// Attempt to update the quantity in SwiftData.
        if quantitySelected > 0 {
            fetchedUserRecipe.quantity = quantitySelected
        } else {
            context.delete(fetchedUserRecipe)
        }

        try? context.save()
    }

    // MARK: ViewBuilders

    /// The button used to add the recipe to the `UserRecipe` store. If the recipe has not already
    /// been added, add it. If it has, show a picker to modify the quantity or delete it.
    @ViewBuilder private func addRecipeButton() -> some View {
        if let recipe {
            Button {
                if quantitySelected == 0 {
                    let userRecipe = UserRecipe(recipe: recipe)
                    context.insert(userRecipe)
                    try? context.save()
                    updateQuantitySelected()
                }
                isShowingQuantitySelector = true
            } label: {
                HStack {
                    if quantitySelected > 0 {
                        Text("\(displayQuantity)")
                            .bold()
                    }
                    Image(
                        systemName: (
                            quantitySelected > 0 
                                ? "checkmark"
                                : "plus"
                        )
                    )
                }
            }
        }
    }

    /// ViewBuilder to create the Picker used to modify the recipe's quantity.
    @MainActor @ViewBuilder private func quantitySelector() -> some View {
        NavigationStack {
            Picker("Quantity", selection: $quantitySelected) {
                ForEach(0...100, id: \.self) {
                    Text("\($0 * displayQuantityFactor)").tag($0)
                }
            }
            .navigationTitle("Quantity")
            .navigationBarTitleDisplayMode(.inline)
            .pickerStyle(.wheel)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        quantitySelected = 0
                        updateSwiftDataQuantity()
                        isShowingQuantitySelector = false
                    } label: {
                        Label("Delete Recipe", systemImage: "trash")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        updateSwiftDataQuantity()
                        isShowingQuantitySelector = false
                    } label: {
                        Text("Confirm")
                    }
                }
            }
        }
    }

    // MARK: Initialization

    /// Memberwise initializer.
    init(recipe: Recipe) {
        self.recipe = recipe
        self.recipeID = recipe.id
    }

    /// Initialize with only the recipe ID.
    init(recipeID: Int) {
        self.recipeID = recipeID
    }
}

// MARK: Previews

#if DEBUG
#Preview("Bronze Ingot") {
    RecipeDetailView(recipeID: 1)
        .modelContainer(previewContainer)
}

#Preview("Master Recipe") {
    RecipeDetailView(recipeID: 30968)
        .modelContainer(previewContainer)
}
#endif
