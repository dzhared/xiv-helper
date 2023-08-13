import SwiftUI

// MARK: - IngredientBadge

struct IngredientBadge: View {
    
    // MARK: Properties
    
    let ingredient: Ingredient
    var imageURL: URL {
        URL(string: "https://xivapi.com\(ingredient.icon)")!
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            AsyncImage(url: imageURL, scale: 2) { image in
                image
            } placeholder: {
                ProgressView()
                    .frame(width: 40, height: 40)
            }
            Text(ingredient.name)
                .font(.title3)
                .padding(.leading, 4.0)
            Spacer()
            Text(String(ingredient.quantity))
                .font(.title3)
                .padding(.trailing, 10)
        }
    }
}
