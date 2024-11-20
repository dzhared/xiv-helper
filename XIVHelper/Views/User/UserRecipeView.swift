import SwiftUI
import SwiftData

/// Displays all recipes the user has added to their shopping cart.
struct UserRecipeView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// The current Dynamic Type size.
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    /// Whether the deletion confirmation dialog is showing.
    @State private var isShowingConfirmationDialog = false

    /// Whether the alert is showing.
    @State private var isShowingAlert = false

    /// Whether the sort options dialog is showing.
    @State private var isShowingSortOptions = true

    /// The shared settings manager instance.
    @ObservedObject var settings = SettingsManager.shared

    /// The user's `UserRecipe` objects.
    @Query var userRecipes: [UserRecipe]

    /// The user's `UserRecipe` objects, sorted using the given sort method.
    private var userRecipesSorted: [UserRecipe] {
        let sortedRecipes: [UserRecipe]

        switch settings.userSortMethod {
        case .alphabetical:
            sortedRecipes = userRecipes.sorted { $0.recipe.resultName.en < $1.recipe.resultName.en }
        case .ilvl:
            sortedRecipes = userRecipes.sorted { $0.recipe.resultIlvl < $1.recipe.resultIlvl }
        case .patch:
            sortedRecipes = userRecipes.sorted { $0.recipe.resultPatch < $1.recipe.resultPatch }
        case .rlvl:
            sortedRecipes = userRecipes.sorted { $0.recipe.recipeLevel < $1.recipe.recipeLevel }
        }

        return settings.userAscending ? sortedRecipes : sortedRecipes.reversed()
    }

    // MARK: Body

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    if userRecipes.isEmpty {
                        Button {
                            settings.selectedTab = 1
                        } label: {
                            ZStack(alignment: .center) {
                                Text(AppStrings.User.noRecipes)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    } else {
                        ForEach(userRecipesSorted, id: \.id) { userRecipe in
                            NavigationLink {
                                RecipeDetailView(recipe: userRecipe.recipe)
                            } label: {
                                ListBadgeView(userRecipe: userRecipe)
                                    .swipeActions(allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            context.delete(userRecipe)
                                        } label: {
                                            Label(AppStrings.User.deleteItem, systemImage: "trash")
                                        }
                                    }
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    Spacer()
                        .frame(height: 64)
                }
                if !userRecipes.isEmpty {
                    NavigationLink {
                        ShoppingListView()
                    } label: {
                        shoppingCartButton()
                    }
                    .padding(16)
                }
            }

            // Deletion confirmation dialog
            .confirmationDialog(
                AppStrings.User.deletionConfirmation,
                isPresented: $isShowingConfirmationDialog,
                titleVisibility: .visible
            ) {
                Button(AppStrings.General.yes, role: .destructive) {
                    withAnimation {
                        try? context.delete(model: UserRecipe.self)
                    }
                }
            }
            .navigationTitle(AppStrings.Navigation.savedRecipes)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Sort options
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker(AppStrings.User.sortMethod, selection: $settings.userSortMethod) {
                            ForEach(SortMethod.allCases, id: \.rawValue) { method in
                                Text(method.rawValue)
                                    .tag(method)
                            }
                        }
                        Picker(AppStrings.User.sortOrder, selection: $settings.userAscending) {
                            Text(AppStrings.Search.ascending)
                                .tag(true)
                            Text(AppStrings.Search.descending)
                                .tag(false)
                        }
                    } label: {
                        Label(AppStrings.General.sort, systemImage: "arrow.up.arrow.down")
                            .labelStyle(.titleAndIcon)
                    }
                }

                // Prompt the user to delete all
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        isShowingConfirmationDialog = true
                    } label: {
                        Label(AppStrings.User.deleteAll, systemImage: "trash")
                    }
                }
            }
        }
    }

    /// Displays a button to generate a shopping list, if recipes have been added.
    @ViewBuilder private func shoppingCartButton() -> some View {
        HStack(alignment: .center) {
            Image(systemName: "cart")
            Text(AppStrings.User.createShoppingList)
        }
        .bold()
        .foregroundStyle(Color.accentColor)
        .padding(16)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(radius: 2)
    }
}

// MARK: Previews

#if DEBUG
#Preview {
    UserRecipeView()
        .modelContainer(previewContainer)
}
#endif
