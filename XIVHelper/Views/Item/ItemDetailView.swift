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
                sectionItemBadge()
                sectionItemDescription()
                sectionStats()
                sectionBonuses()
                sectionGatheringNodes()
                sectionRecipes()
                sectionSupply()
                sectionGrandCompanyExpertDelivery()
                sectionLeves()
            }
            .navigationTitle(AppStrings.Navigation.itemDetail)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent()
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

    // MARK: Content Builders

    /// The Bonuses section for the item.
    @ViewBuilder private func sectionBonuses() -> some View {
        if let item, !item.bonuses.isEmpty {
            Section(AppStrings.Item.bonuses) {
                ParameterGrid(bonuses: item.bonuses, hq: settings.hq)
            }
        }
    }

    /// The Gathering Nodes section for the item.
    @ViewBuilder private func sectionGatheringNodes() -> some View {
        if let item, let nodes = item.nodes, !nodes.isEmpty, item.canBeGathered ?? false {
            Section(AppStrings.General.gathering) {
                ForEach(nodes.prefix(5)) { node in
                    VStack(alignment: .leading) {
                        Text(node.mapName.string)
                            .bold()
                        Text(String(
                            format: AppStrings.Item.locationAndCoordinates,
                            node.name.string,
                            String(format: "%.1f", node.x),
                            String(format: "%.1f", node.y)
                        ))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }

                if nodes.count > 5 {
                    NavigationLink {
                        ItemNodesView(nodes: nodes)
                    } label: {
                        Text(String(format: AppStrings.Item.allNodes, nodes.count))
                            .foregroundStyle(Color.accentColor)
                            .multilineTextAlignment(.leading)
                    }

                }
            }
        }
    }

    /// The Grand Company Expert Delivery section for the item.
    @ViewBuilder private func sectionGrandCompanyExpertDelivery() -> some View {
        if let item, let gcReward = item.gcReward {
            Section(AppStrings.General.expertDelivery) {
                HStack(spacing: 8) {
                    ScalingImage(ImageResource.gcSeal)
                    Text(String(format: AppStrings.Item.seals, gcReward))
                }
            }
        }
    }

    /// The main item badge section for the item.
    @ViewBuilder private func sectionItemBadge() -> some View {
        if let item {
            Section(AppStrings.General.item) {
                VStack(alignment: .leading) {
                    ItemTitleBadgeView(item: item)
                }
            }
        }
    }

    /// The Item Description section for the item.
    @ViewBuilder private func sectionItemDescription() -> some View {
        if let item, !item.desc.string.isEmpty {
            Section(AppStrings.General.description) {
                Text(item.desc.string)
            }
        }
    }

    /// The Leves section for the item.
    @ViewBuilder private func sectionLeves() -> some View {
        if let item, !item.leves.isEmpty {
            Section(AppStrings.General.leves) {
                ForEach(item.leves, id: \.leve) { leve in
                    let classJobCategory = ClassJobCategory(id: leve.classJob)
                    HStack {
                        Image(classJobCategory.name)
                            .resizable()
                            .frame(width: 32, height: 32)
                        VStack(alignment: .leading) {
                            Text(leve.name.string)
                            Text(String(
                                format: AppStrings.Item.levelAndType,
                                leve.lvl,
                                classJobCategory.name
                            ))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    /// The Recipes section for the item.
    @ViewBuilder private func sectionRecipes() -> some View {
        if let item {
            Section(AppStrings.General.recipes) {
                if !item.recipes.isEmpty {
                    ForEach(item.recipes) { recipe in
                        let classJob = ClassJob(id: recipe.classJob)
                        NavigationLink {
                            RecipeDetailView(recipeID: recipe.id)
                        } label: {
                            HStack {
                                classJob.icon
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                Text(String(
                                    format: AppStrings.Item.levelAndType,
                                    recipe.lvl,
                                    classJob.abbreviation
                                ))
                            }
                        }
                    }
                } else {
                    Text(AppStrings.Item.noRecipes)
                }
            }
        }
    }

    /// The Stats section for the item.
    @ViewBuilder private func sectionStats() -> some View {
        if let item, !item.statsMain.isEmpty || !item.statsSecondary.isEmpty {
            Section(AppStrings.Item.stats) {
                if !item.statsMain.isEmpty {
                    ParameterGrid(stats: item.statsMain, hq: settings.hq)
                }
                if !item.statsSecondary.isEmpty {
                    ParameterGrid(stats: item.statsSecondary, hq: settings.hq)
                }
            }
        }
    }

    /// The Supply section for the item.
    @ViewBuilder private func sectionSupply() -> some View {
        if let item, let supply = item.supply, supply.amount > 0 {
            let sealsText: String = String(
                format: AppStrings.Item.seals,
                10
            )
            let xpString = String(
                format: AppStrings.Item.xp,
                5
            )

            Section(String(AppStrings.Item.grandCompanyQuantity)) {
                HStack(spacing: 16) {
                    ScalingImage(ImageResource.gcSeal)
                    Text(sealsText)
                }
                HStack(spacing: 16) {
                    ScalingImage(ImageResource.EXP)
                    Text(xpString)
                }
            }
        }
    }

    /// The toolbar content to toggle HQ stats, if applicable.
    @ToolbarContentBuilder private func toolbarContent() -> some ToolbarContent {
        if let item, item.canBeHq, (!item.statsMain.isEmpty || !item.statsSecondary.isEmpty) {
            // HQ toggle, if item can be HQ and has stats to display
            ToolbarItem(placement: .primaryAction) {
                Toggle(isOn: $settings.hq) {
                    Image(ImageResource.HQ)
                        .scaleEffect(1.5)
                        .padding(.trailing, 4)
                }
                .toggleStyle(.switch)
            }
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

#if DEBUG
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
#endif
