import SwiftUI
import SwiftData

/// Displays detailed information about a given Item, including descriptions, stats, bonuses,
/// recipes, Grand Company information, and HQ versions.
struct ItemDetailView: View {

    // MARK: Properties

    /// The SwiftData model context.
    @Environment(\.modelContext) private var context

    /// The current Dynamic Type size.
    @Environment(\.dynamicTypeSize) private var size

    /// The shared settings manager instance.
    @ObservedObject var settings = SettingsManager.shared

    /// The fetched item.
    @State private var item: Item?

    /// The ID of the item to be displayed.
    let itemID: Int

    // MARK: Body

    var body: some View {
        NavigationStack {
            List {
                if let item {
                    // Main item badge
                    Section {
                        VStack(alignment: .leading) {
                            ItemTitleBadgeView(item: item)
                        }
                    }

                    // Item description
                    if !item.desc.en.isEmpty {
                        Section("Description") {
                            Text(item.desc.string)
                        }
                    }

                    // Stats (Defense, Magic Defense, etc)
                    if !item.statsMain.isEmpty || !item.statsSecondary.isEmpty {
                        Section("Stats") {
                            if !item.statsMain.isEmpty {
                                ParameterGrid(stats: item.statsMain, hq: settings.hq)
                            }
                            if !item.statsSecondary.isEmpty {
                                ParameterGrid(stats: item.statsSecondary, hq: settings.hq)
                            }
                        }
                    }

                    // Bonuses (food, potions, etc)
                    if !item.bonuses.isEmpty {
                        Section("Bonuses") {
                            ParameterGrid(bonuses: item.bonuses, hq: settings.hq)
                        }
                    }

                    if item.canBeGathered, !item.nodes.isEmpty {
                        Section("Gathering") {
                            ForEach(item.nodes.prefix(5)) { node in
                                VStack(alignment: .leading) {
                                    Text(node.mapName.string)
                                        .bold()
                                    Text("\(node.name.string) (x: \(String(format: "%.1f", node.x)), y: \(String(format: "%.1f", node.y)))")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }

                            if item.nodes.count > 5 {
                                NavigationLink {
                                    ItemNodesView(nodes: item.nodes)
                                } label: {
                                    Text("All Nodes (\(item.nodes.count))")
                                        .foregroundStyle(Color.accentColor)
                                        .multilineTextAlignment(.leading)
                                }

                            }
                        }
                    }

                    // Recipes
                    Section("Recipes") {
                        if !item.recipes.isEmpty {
                            ForEach(item.recipes, id: \.id) { recipe in
                                let abbreviation = ClassJob(id: recipe.classJob).abbreviation
                                NavigationLink {
                                    RecipeDetailView(recipeID: recipe.id)
                                } label: {
                                    HStack {
                                        Image("\(abbreviation)")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                        Text("Level \(recipe.lvl) \(abbreviation)")
                                    }
                                }
                            }
                        } else {
                            Text(AppStrings.Item.noRecipes)
                        }
                    }

                    // Grand Company Supply info, if applicable
                    if let supply = item.supply {
                        Section("Grand Company (\(supply.amount) Required)") {
                            HStack(spacing: 16) {
                                ScalingImage("GCSeal")
                                Text("\(settings.hq ? supply.sealsHq : supply.seals) Seals")
                            }
                            HStack(spacing: 16) {
                                ScalingImage("EXP")
                                Text("\(settings.hq ? supply.xpHq : supply.xp) XP")
                            }
                        }
                    }

                    // Grand Company expert delivery info, if applicable
                    if let gcReward = item.gcReward {
                        Section("Expert Delivery") {
                            HStack(spacing: 8) {
                                ScalingImage("GCSeal")
                                Text("\(gcReward) Seals")
                            }
                        }
                    }

                    // Leves, if applicable
                    if !item.leves.isEmpty {
                        Section("Leves") {
                            ForEach(item.leves, id: \.leve) { leve in
                                let classJobCategory = ClassJobCategory(id: leve.classJob)
                                // TODO: Add LeveDetailView
                                HStack {
                                    Image(classJobCategory.name)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    VStack(alignment: .leading) {
                                        Text(leve.name.string)
                                        Text("Level \(leve.lvl) \(classJobCategory.name)")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(AppStrings.Navigation.itemDetail)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if let item, item.canBeHq {
                    // HQ toggle, if item can be HQ
                    ToolbarItem(placement: .primaryAction) {
                        Toggle(isOn: $settings.hq) {
                            Image("HQ")
                                .scaleEffect(1.5)
                                .padding(.trailing, 4)
                        }
                        .toggleStyle(.switch)
                    }
                }
            }
        }
        .onAppear {
            fetchItem()
        }
    }

    // MARK: Private Methods

    /// Fetches the item from the item ID, if not already loaded.
    private func fetchItem() {
        /// Do not search if an item already populated the view.
        guard item == nil else { return }

        var fetchDescriptor = FetchDescriptor<Item>(
            predicate: #Predicate { $0.id == itemID }
        )
        fetchDescriptor.fetchLimit = 1

        do {
            let fetchedItems = try context.fetch(fetchDescriptor)
            item = fetchedItems.first
        } catch {
            item = nil
        }
    }

    // MARK: Initialization

    /// Initialize with only the item's ID.
    init(itemID: Int) {
        self.itemID = itemID
    }

    /// Initialize with the `Item` already defined.
    init(item: Item) {
        self.item = item
        self.itemID = item.id
    }
}

// MARK: Previews

#Preview("Iron Bar") {
    ItemDetailView(itemID: 5057)
        .modelContainer(previewContainer)
}

#Preview("Blue Armor") {
    ItemDetailView(itemID: 8893)
        .modelContainer(previewContainer)
}

#Preview("Food") {
    ItemDetailView(itemID: 36047)
        .modelContainer(previewContainer)
}

#Preview("Fish") {
    ItemDetailView(itemID: 27430)
        .modelContainer(previewContainer)
}

#Preview("Crafted Weapon") {
    ItemDetailView(itemID: 1614)
        .modelContainer(previewContainer)
}
