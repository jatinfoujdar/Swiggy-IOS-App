
import SwiftUI

struct SearchUIView: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack {
           
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search for 'Grocery'", text: $searchText)
                    .padding(.vertical, 15)
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 10)

            Image(systemName: "cart")
                .font(.title)
                .padding(14)
                .background(
                    Circle()
                        .fill(Color.white)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
        }
    }
}

#Preview {
    SearchUIView()
}

