import SwiftUI

// MARK: - ParameterGrid

struct ParameterGrid: View {
    
    // MARK: Properties
    
    /// The `Recipe` whose parameters are being displayed.
    let allParameters: [(label: String, value: Int)]
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(allParameters, id: \.0) { parameter in
                if parameter != allParameters[0] {
                    Spacer()
                }
                parameterStack(label: parameter.label, value: parameter.value)
            }
        }
        .multilineTextAlignment(.center)
    }
    
    // MARK: ViewBuilders
    
    /// Represents a key-value pair for a given parameter.
    @ViewBuilder private func parameterStack(label: String, value: Int) -> some View {
        VStack {
            Text(label)
                .font(.caption.bold())
            Text(String(value))
                .font(.title3)
        }
    }
    
    // MARK: Initializers
    
    /// Initializes as an `HStack` for the parameters of a `Recipe`.
    init(recipe: Recipe) {
        self.allParameters = [
            ("Difficulty", recipe.difficulty),
            ("Durability", recipe.durability),
            ("Craftsmanship", recipe.suggestedCraftsmanship),
            ("Control", recipe.suggestedControl),
        ]
    }
}

// MARK: - PreviewProvider

struct ParameterGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Section {
                    ParameterGrid(recipe: .example)
                }
            }
        }
    }
}
