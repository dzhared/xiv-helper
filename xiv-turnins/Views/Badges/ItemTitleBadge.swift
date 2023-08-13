import SwiftUI

// MARK: - ItemTitleBadge

struct ItemTitleBadge: View {
    
    // MARK: Properties
    
    /// The `Item` to be displayed.
    let item: Item
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: "https://xivapi.com\(item.icon)"), scale: 1.5) { image in
                image
            } placeholder: {
                ProgressView()
            }
            .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                Text("ilvl \(item.levelItem)")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                
                // Exclude equipClass for consumable items
                if let equipClass = item.classJobCategory.equipClass {
                    Text(equipClass)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct ItemTitleBadge_Previews: PreviewProvider {
    static var previews: some View {
        ItemTitleBadge(item: Item.example)
    }
}
