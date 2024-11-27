import SwiftUI

/// Contains the icon, name and type of an item. Used in multiple views.
struct ItemTitleBadgeView: View {

    // MARK: Properties

    /// Optionally, the item's ClassJobCategory for display.
    let classJobCategory: ClassJobCategory?

    /// The URL of the item's icon.
    let icon: URL

    /// The item level of the item.
    let ilvl: Int

    /// The `ItemCategory` object for the corresponding ID.
    var itemCategory: ItemCategory {
        ItemCategory(id: itemCategoryId)
    }

    /// The ID of the item's category.
    let itemCategoryId: Int

    /// The name of the item.
    let name: LocalizedString

    /// Optionally, the patch the item was added in.
    let patch: Patch?

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                AsyncImage(url: icon, scale: 1.5) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .shadow(radius: 3)
                .padding(.trailing, 8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(name.string)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true) // Prevent truncating in List
                    if let classJobCategory {
                        Text(classJobCategory.name)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Text(String(
                        format: AppStrings.Item.levelAndType,
                        ilvl,
                        itemCategory.name.string
                    ))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }
            }
            if let patch {
                Divider()
                HStack {
                    Spacer()
                    Text(patch.name.string)
                        .font(.subheadline.smallCaps())
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
        }
        .multilineTextAlignment(.leading)
    }

    // MARK: Initialization

    /// Memberwise initializer.
    init(icon: URL, ilvl: Int, itemCategoryId: Int, name: LocalizedString, classJobCategory: ClassJobCategory?, patch: Patch?) {
        self.classJobCategory = classJobCategory
        self.icon = icon
        self.ilvl = ilvl
        self.itemCategoryId = itemCategoryId
        self.name = name
        self.patch = patch
    }

    /// Initialize the view with only an `Item`.
    init(item: Item) {
        self.classJobCategory = item.classJobCategory
        self.icon = item.iconUrl
        self.ilvl = item.ilvl ?? 0
        self.itemCategoryId = item.itemCategory
        self.name = item.name
        self.patch = item.patch
    }

    /// Initialize the view with only a `Recipe`.
    init(recipe: Recipe) {
        self.classJobCategory = recipe.resultItem?.classJobCategory
        self.icon = recipe.icon
        self.ilvl = recipe.resultIlvl
        self.itemCategoryId = recipe.resultItemCategory
        self.name = recipe.resultName
        self.patch = recipe.resultItem?.patch ?? nil
    }
}

// MARK: Previews

#if DEBUG
@MainActor let view = ItemTitleBadgeView(
    icon: URL(string: "https://xivapi.com/i/054000/054918_hr1.png")!,
    ilvl: 115,
    itemCategoryId: 40,
    name: LocalizedString(
        en: "Rainbow Ribbon of Fending",
        ja: "レインボークロスリボン・オブ・ディフェンス",
        de: "Regenbogen-Schleife der Verteidigung",
        fr: "Ruban de protecteur en étoffe arc-en-ciel"
    ),
    classJobCategory: ClassJobCategory(id: 34),
    patch: Patch(id: 19)
)

#Preview {
    view
}

#Preview("In Context") {
    List {
        Section {
            view
        }
    }
}
#endif
