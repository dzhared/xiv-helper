import SwiftUI

// MARK: - LeveView

struct LeveView: View {
    
    // MARK: Properties
    
    /// The `Leve` to be displayed.
    let leve: Leve
    
    // MARK: Body
    
    var body: some View {
        NavigationLink(destination: LeveDetailView(leve: leve)) {
            HStack {
                AsyncImage(url: leve.iconURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(leve.name)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading, 7)
                Spacer()
            }
        }
    }
}

// MARK: - PreviewProvider

struct LeveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                LeveView(leve: Leve.example)
            }
        }
    }
}
