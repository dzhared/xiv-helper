import SwiftUI

/// Displays all nodes an item can be collected at, when truncation is needed.
struct ItemNodesView: View {

    /// All nodes to be displayed.
    let nodes: [Node]

    var body: some View {
        NavigationStack {
            List {
                ForEach(nodes) { node in
                    VStack(alignment: .leading) {
                        Text(node.mapName.string)
                            .bold()
                        Text("\(node.name.string) (x: \(String(format: "%.1f", node.x)), y: \(String(format: "%.1f", node.y)))")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle(AppStrings.Navigation.allNodes)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
