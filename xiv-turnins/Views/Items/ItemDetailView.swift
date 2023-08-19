import SwiftUI

// MARK: - ItemDetailView

struct ItemDetailView: View {
    
    // MARK: Properties
    
    /// The `Item` to be displayed.
    let item: Item
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            List {
                ItemTitleBadge(item: item)
                ClassJobBadge(item: item)
                IngredientList(recipeID: item.itemRecipeInfo[0].id)
            }
        }
    }
}

// MARK: - PreviewProvider

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: .example)
    }
}
