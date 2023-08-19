import SwiftUI

// MARK: - ClassJobBadge

struct ClassJobBadge: View {

    // MARK: Properties

    /// The class or job to be displayed.
    let classJobCategory: ClassJobCategory

    /// The level of the class to be displayed.
    let level: Int

    // MARK: Body

    var body: some View {
        Section {
            HStack {
                Image(classJobCategory.equipClass ?? "BLM")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .topLeading)
                VStack(alignment: .leading) {
                    Text("Level \(level) \(classJobCategory.fullEquipClass)")
                        .font(.title3)
                }
            }
        }
    }

    /// Initializes the badge using an explicit `ClassJobCategory` and level.
    init(classJobCategory: ClassJobCategory, level: Int) {
        self.classJobCategory = classJobCategory
        self.level = level
    }

    /// Initializes the badge using an `Item`.
    init(item: Item) {
        self.classJobCategory = ClassJobCategory(equipClass: item.classJob.0)
        self.level = item.itemRecipeInfo[0].level
    }

    /// Initializes the badge using a `Leve`.
    init(leve: Leve) {
        self.classJobCategory = leve.classJobCategory
        self.level = leve.classJobLevel
    }
}

// MARK: - PreviewProvider

struct ClassJobBadge_Previews: PreviewProvider {
    static var previews: some View {
        ClassJobBadge(item: .example)
            .previewDisplayName("init(item:_)")
        ClassJobBadge(leve: .example)
            .previewDisplayName("init(leve:_)")
        ClassJobBadge(classJobCategory: ClassJobCategory.example, level: 30)
            .previewDisplayName("Default Initializer")
    }
}
