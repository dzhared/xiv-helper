import SwiftUI

/// Displays basic information of an item, ingredient, recipe, etc. Used for lists and navigation.
struct ListBadgeView: View {

    // MARK: Properties

    /// The badge's icon image URL.
    let icon: URL

    /// The localized name for the badge..
    let name: LocalizedString

    /// The number of the ingredient needed.
    let quantity: Int?

    /// The optional subtitle for the badge.
    let subtitle: String?

    // MARK: Body

    var body: some View {
        HStack {
            AsyncImage(url: icon, scale: 2) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(name.string)
                    .font(.title3)
                if let subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.leading, 4.0)
            Spacer()
            if let quantity {
                Text(String(quantity))
                    .font(.title3)
                    .padding(.trailing, 10)
            }
        }
    }

    // MARK: Initialization

    /// Memberwise initializer.
    init(icon: URL, name: LocalizedString, quantity: Int?, subtitle: String?) {
        self.icon = icon
        self.name = name
        self.quantity = quantity
        self.subtitle = subtitle
    }

    /// Initialize the badge with an `Ingredient`.
    init(ingredient: Ingredient) {
        self.icon = ingredient.icon
        self.name = ingredient.name
        self.quantity = ingredient.quantity
        self.subtitle = nil
    }

    /// Initialize the badge with an `Item`.
    @MainActor init(item: Item) {
        self.icon = item.iconUrl
        self.name = item.name
        self.quantity = nil
        if let ilvl = item.ilvl {
            self.subtitle = "Level \(ilvl) \(ItemCategory(id: item.itemCategory).name.string)"
        } else {
            self.subtitle = nil
        }
    }

    /// Initialize the badge with a `Recipe`.
    init(recipe: Recipe) {
        self.icon = recipe.icon
        self.name = recipe.resultName
        self.quantity = nil
        self.subtitle = "Level \(recipe.classJobLevel) \(recipe.classJob.abbreviation)"
    }

    /// Initialize the badge with a `UserRecipe`.
    init(userRecipe: UserRecipe) {
        self.icon = userRecipe.recipe.icon
        self.name = userRecipe.recipe.resultName
        self.quantity = userRecipe.quantity * userRecipe.recipe.yields
        self.subtitle = "Level \(userRecipe.recipe.classJobLevel) \(userRecipe.recipe.classJob.abbreviation)"
    }
}
