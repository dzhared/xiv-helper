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

    /// The search field localized text.
    private var promptText: String {
        let promptText: String = {
            switch settings.searchType {
            case .gathering:
                return AppStrings.General.gathering
            case .items:
                return AppStrings.General.items
            case .recipes:
                return AppStrings.General.recipes
            }
        }().lowercasedByLocale()
        return String(format: AppStrings.Search.searchFieldPrompt, promptText)
    }

    /// The recipes that match the search text.
    @State private var recipes: [Recipe] = []

    /// The resulting `Item` objects, sorted using the given sort method.
    private var sortedItems: [Item] {
        var sortedItems: [Item]

        switch settings.searchSortMethod {
        case .alphabetical:
            sortedItems = items.sorted { $0.name < $1.name }
        case .ilvl:
            sortedItems = items.sorted { $0.ilvl ?? 1 < $1.ilvl ?? 1 }
        case .patch:
            sortedItems = items.sorted { $0.patchId < $1.patchId }
        default:
            sortedItems = items.sorted { $0.name < $1.name }
        }

        return settings.searchAscending ? sortedItems : sortedItems.reversed()
    }

    /// The resulting `Recipe` objects, sorted using the given sort method.
    private var sortedRecipes: [Recipe] {
        var sortedRecipes: [Recipe]

        switch settings.searchSortMethod {
        case .alphabetical:
            sortedRecipes = recipes.sorted { $0.resultName < $1.resultName }
        case .ilvl:
            sortedRecipes = recipes.sorted { $0.resultIlvl < $1.resultIlvl }
        case .patch:
            sortedRecipes = recipes.sorted { $0.resultPatch < $1.resultPatch }
        case .rlvl:
            sortedRecipes = recipes.sorted { $0.recipeLevel < $1.recipeLevel }
        }

        return settings.searchAscending ? sortedRecipes : sortedRecipes.reversed()
    }

    // MARK: Body

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 8) {
                    // Pick items or recipes
                    Picker(AppStrings.Search.pickerPrompt, selection: $settings.searchType) {
                        Text(AppStrings.General.items)
                            .tag(SearchType.items)
                        Text(AppStrings.General.recipes)
                            .tag(SearchType.recipes)
                        Text(AppStrings.General.gathering)
                            .tag(SearchType.gathering)
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
                    case .items, .gathering:
                        if sortedItems.isEmpty && !debouncer.searchText.isEmpty {
                            Text(AppStrings.Search.noResults)
                        } else if items.isEmpty {
                            Button(AppStrings.Search.searchButton) {
                                isSearching = true
                            }
                        } else {
                            ForEach(sortedItems, id: \.id) { item in
                                NavigationLink {
                                    ItemDetailView(item: item)
                                } label: {
                                    ListBadgeView(item: item)
                                }
                            }
                        }
                    case .recipes:
                        if sortedRecipes.isEmpty && !debouncer.searchText.isEmpty {
                            Text(AppStrings.Search.noResults)
                        } else if recipes.isEmpty {
                            Button(AppStrings.Search.searchButton) {
                                isSearching = true
                            }
                        } else {
                            ForEach(sortedRecipes, id: \.id) { recipe in
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
                            Text(AppStrings.SortMethod.alphabetical)
                                .tag(SortMethod.alphabetical)
                            Text(AppStrings.SortMethod.ilvl)
                                .tag(SortMethod.ilvl)
                            Text(AppStrings.SortMethod.patch)
                                .tag(SortMethod.patch)
                            Text(AppStrings.SortMethod.rlvl)
                                .tag(SortMethod.rlvl)
                        }
                        Picker(AppStrings.User.sortOrder, selection: $settings.searchAscending) {
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
            }
        }
        .searchable(
            text: $debouncer.searchText,
            isPresented: $isSearching,
            placement: .toolbar,
            prompt: promptText)
        .autocorrectionDisabled()
        .onReceive(debouncer.searchTextPublisher) { searchText in
            fetchItems(searchText: searchText)
            fetchRecipes(searchText: searchText)
        }
    }

    // MARK: Private Methods

    /// Fetches the items that match the search text, and assigns them to `items`.
    private func fetchItems(searchText: String) {
        var descriptor: FetchDescriptor<Item> = {
            if settings.searchType == .gathering {
                return FetchDescriptor<Item>(predicate: #Predicate<Item> {
                    $0.name.en.localizedStandardContains(searchText) &&
                    ($0.canBeGathered ?? false)
                })
            }
            else {
                return FetchDescriptor<Item>(predicate: #Predicate<Item> {
                    $0.name.en.localizedStandardContains(searchText)
                })
            }
        }()
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

#if DEBUG
#Preview {
    SearchView()
        .modelContainer(previewContainer)
}
#endif
