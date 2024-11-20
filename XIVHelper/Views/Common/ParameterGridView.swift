import SwiftUI

/// Displays a grid of parameters. Used for both recipes and items.
struct ParameterGrid: View {

    // MARK: Properties

    /// The current Dynamic Type size.
    @Environment(\.dynamicTypeSize) private var size

    /// The arrangement of columns for the `LazyVGrid`.
    private var columns: [GridItem] {
        size > .large || forceOneColumn ? [
            GridItem(.flexible()),
        ] : [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    }

    /// Whether to force into one column.
    let forceOneColumn: Bool

    /// The recipe to show parameters for.
    private let parameters: [(String, String)]

    // MARK: Body

    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
            ForEach(parameters, id: \.0) { name, value in
                Text(AttributedString(
                    format: AppStrings.General.textAndBoldText,
                    name,
                    value
                ))
                .multilineTextAlignment(.leading)
            }
        }
    }

    // MARK: Initialization

    /// Initialize with the parameters explicitly defined.
    init(parameters: [(String, Int)]) {
        self.forceOneColumn = false
        self.parameters = parameters.map { key, value in
            (key, String(value))
        }
    }

    /// Initialize with item bonuses.
    init(bonuses: [Bonus], hq: Bool) {
        self.forceOneColumn = true
        self.parameters = bonuses.map {
            let value = (hq ? $0.hq : $0.nq) ?? $0.nq
            let max = (hq ? $0.maxHQ : $0.max) ?? $0.max
            if let max {
                return ($0.baseParam.name, "\(value) (max +\(max))")
            } else {
                return ($0.baseParam.name, "\(value)")
            }
        }
    }

    /// Initialize with item stats.
    init(stats: [Stat], hq: Bool) {
        self.forceOneColumn = false
        self.parameters = stats.map {
            let value = (hq ? $0.hq : $0.nq) ?? $0.nq
            return ($0.baseParam.name, String(value))
        }
    }

    /// Initialize with a recipe for its given parameters.
    init(recipe: Recipe) {
        self.forceOneColumn = false
        self.parameters = [
            ("Recipe Level", String(recipe.recipeLevel)),
            ("Progress", String(recipe.progress)),
            ("Durability", String(recipe.durability)),
            ("Quality", String(recipe.quality)),
            ("Yields", String(recipe.yields))
        ]
        .filter { $0.1 != "0" }
    }
}
