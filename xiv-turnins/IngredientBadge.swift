//
//  IngredientBadge.swift
//  xiv-turnins
//
//  Created by Jared on 4/7/23.
//

import SwiftUI

struct IngredientBadge: View {
    
    let ingredient: Ingredient
    var imageURL: URL {
        URL(string: "https://xivapi.com\(ingredient.icon)")!
    }
    
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
