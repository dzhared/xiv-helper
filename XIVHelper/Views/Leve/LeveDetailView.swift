import SwiftUI

// TODO: Add Leve details

/// Displays information about a given Leve.
struct LeveDetailView: View {

    // MARK: Properties

    /// The leve to be displayed.
    let leve: Leve

    // MARK: Body

    var body: some View {
        EmptyView()
    }
}

// MARK: Previews

#if DEBUG
#Preview {
    LeveDetailView(
        leve: Leve(
            leve: 5,
            amount: 3,
            lvl: 20,
            name: LocalizedString(en: "A Stitch in Time"),
            classJob: 9
        )
    )
}
#endif
