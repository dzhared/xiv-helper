import SwiftUI

// TODO: Flesh this out and implement

/// Displays available search options for sorting and filtering.
struct SearchSheetView: View {

    // MARK: Properties

    /// Dismiss the view.
    @Environment(\.dismiss) private var dismiss

    /// The shared settings manager instance, used to sort and filter search results.
    @ObservedObject private var settings = SettingsManager.shared

    // MARK: Body

    var body: some View {
        NavigationStack {
            VStack {
                // TODO: Refactor into own struct
                Picker(AppStrings.Search.pickerPrompt, selection: $settings.searchType) {
                    Text(SearchType.items.rawValue)
                        .tag(SearchType.items)
                    Text(SearchType.recipes.rawValue)
                        .tag(SearchType.recipes)
                }
                .pickerStyle(.segmented)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 4,
                        trailing: 16
                    )
                )
                List {
                    Section("Search Settings") {
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
                        Toggle("Case Sensitive", isOn: $settings.searchCaseSensitive)
                        Toggle("Sort Order: \(settings.searchAscending ? AppStrings.Search.ascending : AppStrings.Search.descending)", isOn: $settings.searchAscending)
                        VStack(alignment: .leading) {
                            Text("Number of Results: **\(settings.searchResultsLimit)**")
                            Slider(
                                value: Binding<Double>(
                                    get: { Double(settings.searchResultsLimit) },
                                    set: { settings.searchResultsLimit = Int($0) }
                                ),
                                in: 10...100,
                                step: 10
                            ) {
                                Text("Number of Results")
                            }
                        }
                    }
                    switch settings.searchType {
                    case .items:
                        Section("Item Settings") {
                            Toggle("Can be HQ Only", isOn: $settings.searchHqOnly)
                            Toggle("Craftable Only", isOn: $settings.searchItemCraftableOnly)
                            Picker(AppStrings.General.expansion, selection: $settings.searchExpansion) {
                                ForEach(Expansion.allCases, id: \.rawValue) { expansion in
                                    Text(expansion.rawValue)
                                        .tag(expansion)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                            Toggle("Tradable Only", isOn: $settings.searchItemTradableOnly)
                            Toggle("Unique Only", isOn: $settings.searchItemUniqueOnly)
                        }
                        Section(AppStrings.General.equipment) {
                            Toggle("Equipment Only", isOn: $settings.searchEquipmentOnly)
                            if settings.searchEquipmentOnly {
                                Picker("Equip Class", selection: $settings.searchEquipmentClass) {
                                    ForEach(AllClassJob.allCases, id: \.rawValue) { classJob in
                                        Text(classJob.rawValue)
                                            .tag(classJob)
                                    }
                                }
                                .pickerStyle(.navigationLink)
                            }
                        }
                        // TODO: Filter by Item Type
                        // Section("Item Type") {
                        //     Toggle("Filter by Item Type", isOn: $settings.searchItemFilterByCategory)
                        //     if settings.searchItemFilterByCategory {
                        //         Picker("Item Category", selection: $settings.searchItemFilterCategory) {
                        //             ForEach(AllItemCategory.allCases, id: \.rawValue) { category in
                        //                 Text(category.rawValue)
                        //                     .tag(category)
                        //             }
                        //         }
                        //         .pickerStyle(.navigationLink)
                        //     }
                        // }
                    case .recipes:
                        Section("Recipe Settings") {
                            
                        }

                    case .gathering:
                        Section("Gathering Settings") {
                            
                        }
                    }

                    Section {
                        Button("Reset to Defaults", role: .destructive) {
                            settings.resetSearchSettings()
                        }
                    }
                }
            }
            .navigationTitle("Filter \(settings.searchType.rawValue) Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(AppStrings.General.done) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    SearchSheetView()
}
#endif
