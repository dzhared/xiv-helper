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
                classJobBadge(item: item)
                IngredientList(recipeID: item.itemRecipeInfo[0].id)
            }
        }
    }
    
    // MARK: ViewBuilders
    
    @ViewBuilder private func classJobBadge(item: Item) -> some View {
        
        /// The name of the class/job for the `Item`.
        let classJob = ClassJobCategory(equipClass: item.classJob.0)
        
        /// The Disciple of the Hand level for the recipe.
        let level = item.itemRecipeInfo[0].level
        
        Section {
            HStack {
                Image(classJob.equipClass ?? "RPR")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .topLeading)
                VStack(alignment: .leading) {
                    Text("Level \(level) \(classJob.fullEquipClass)")
                        .font(.title3)
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item.example)
    }
}
