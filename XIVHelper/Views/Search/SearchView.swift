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

    /// The resulting `Item` objects, sorted using the given sort method.
    private var sortedItems: [Item] {
        var sortedItems: [Item]

        switch settings.searchSortMethod {
        case .alphabetical:
            sortedItems = items.sorted { $0.name.en < $1.name.en }
        case .ilvl:
            sortedItems = items.sorted { $0.ilvl ?? 1 < $1.ilvl ?? 1 }
        case .patch:
            sortedItems = items.sorted { $0.patchId < $1.patchId }
        default:
            sortedItems = items.sorted { $0.name.en < $1.name.en }
        }

        // Filter out Dawntrail content if needed
        if !settings.dawntrailEnabled {
            sortedItems = sortedItems.filter { $0.patchId < 95 }
        }

        return settings.searchAscending ? sortedItems : sortedItems.reversed()
    }

    /// The resulting `Recipe` objects, sorted using the given sort method.
    private var sortedRecipes: [Recipe] {
        var sortedRecipes: [Recipe]

        switch settings.searchSortMethod {
        case .alphabetical:
            sortedRecipes = recipes.sorted { $0.resultName.en < $1.resultName.en }
        case .ilvl:
            sortedRecipes = recipes.sorted { $0.resultIlvl < $1.resultIlvl }
        case .patch:
            sortedRecipes = recipes.sorted { $0.resultPatch < $1.resultPatch }
        case .rlvl:
            sortedRecipes = recipes.sorted { $0.recipeLevel < $1.recipeLevel }
        }

        // Filter out Dawntrail content if needed
        if !settings.dawntrailEnabled {
            sortedRecipes = sortedRecipes.filter { $0.resultPatch < 95 }
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
                        Text(SearchType.items.rawValue)
                            .tag(SearchType.items)
                        Text(SearchType.recipes.rawValue)
                            .tag(SearchType.recipes)
                        Text(SearchType.gathering.rawValue)
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
                        if items.isEmpty && !debouncer.searchText.isEmpty {
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
                        if recipes.isEmpty && !debouncer.searchText.isEmpty {
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
                        Toggle(AppStrings.Info.dawntrailShow, isOn: $settings.dawntrailEnabled)
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

#Preview {
    SearchView()
        .modelContainer(previewContainer)
}
