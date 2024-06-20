import SwiftUI
import SwiftData

// TODO: Add SearchSheetView in future update

/// A view for finding items and recipes.
struct SearchView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// The shared SettingsManager instance.
    @ObservedObject private var settings = SettingsManager.shared

    /// Debouncer to manage search text. Keeps performance smooth during automatic searching.
    @State private var debouncer = Debouncer()

    /// Whether the user is currently searching.
    @State private var isSearching = false

    /// The items that match the search text.
    @State private var items: [Item] = []

    /// The recipes that match the search text.
    @State private var recipes: [Recipe] = []

    // MARK: Body

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 8) {
                    // Pick items or recipes
                    Picker(AppStrings.Search.pickerPrompt, selection: $settings.searchType) {
                        Text(SearchType.items.rawValue)
                            .tag(SearchType.items)
                        Text(SearchType.recipes.rawValue)
                            .tag(SearchType.recipes)
                        // TODO: Add Leves
                    }
                    .pickerStyle(.segmented)
                }
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 4,
                        trailing: 16
                    )
                )

                List {
                    // Search results, depending on search type defined with picker
                    switch settings.searchType {
                    case .items:
                        if items.isEmpty && !debouncer.searchText.isEmpty {
                            Text(AppStrings.Search.noResults)
                        } else if items.isEmpty {
                            Button(AppStrings.Search.searchButton) {
                                isSearching = true
                            }
                        } else {
                            ForEach(items, id: \.id) { item in
                                NavigationLink {
                                    ItemDetailView(item: item)
                                } label: {
                                    ListBadgeView(item: item)
                                }
                            }
                        }
                    case .recipes:
                        if recipes.isEmpty && !debouncer.searchText.isEmpty {
                            Text(AppStrings.Search.noResults)
                        } else if recipes.isEmpty {
                            Button(AppStrings.Search.searchButton) {
                                isSearching = true
                            }
                        } else {
                            ForEach(recipes, id: \.id) { recipe in
                                NavigationLink {
                                    RecipeDetailView(recipe: recipe)
                                } label: {
                                    ListBadgeView(recipe: recipe)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(AppStrings.Navigation.search)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Display sort options
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker(AppStrings.User.sortMethod, selection: $settings.searchSortMethod) {
                            ForEach(SortMethod.allCases, id: \.rawValue) { method in
                                Text(method.rawValue)
                                    .tag(method)
                            }
                        }
                        Picker(AppStrings.User.sortOrder, selection: $settings.searchAscending) {
                            Text("Ascending")
                                .tag(true)
                            Text("Descending")
                                .tag(false)
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
        }
        .searchable(
            text: $debouncer.searchText,
            isPresented: $isSearching,
            placement: .toolbar,
            prompt: AppStrings.Search.searchFieldPrompt + settings.searchType.rawValue.lowercased()
        )
        .autocorrectionDisabled()
        .onReceive(debouncer.searchTextPublisher) { searchText in
            fetchItems(searchText: searchText)
            fetchRecipes(searchText: searchText)
        }
    }

    // MARK: Private Methods

    /// Fetches the items that match the search text, and assigns them to `items`.
    private func fetchItems(searchText: String) {
        var descriptor = FetchDescriptor<Item>(
            predicate: #Predicate<Item> {
                $0.name.en.localizedStandardContains(searchText)
            },
            sortBy: [
                SortDescriptor(\Item.ilvl, order: .reverse)
            ]
        )
        descriptor.fetchLimit = settings.searchResultsLimit
        let fetchedItems = try? context.fetch(descriptor)
        withAnimation(.easeIn) {
            items = fetchedItems ?? []
        }
    }

    /// Fetches the recipes that match the search text, and assigns them to `recipes`.
    private func fetchRecipes(searchText: String) {
        var descriptor = FetchDescriptor<Recipe>(
            predicate: #Predicate<Recipe> {
                $0.resultName.en.localizedStandardContains(searchText)
            },
            sortBy: [
                SortDescriptor(\Recipe.recipeLevel, order: .reverse)
            ]
        )
        descriptor.fetchLimit = settings.searchResultsLimit

        let fetchedRecipes = try? context.fetch(descriptor)
        withAnimation(.easeIn) {
            recipes = fetchedRecipes ?? []
        }
    }
}

// MARK: Previews

#Preview {
    SearchView()
        .modelContainer(previewContainer)
}
