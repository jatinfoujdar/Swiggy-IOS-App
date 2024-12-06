import SwiftUI

struct GridCardView: View {
    var restaurants: [Restaurant]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(restaurants, id: \.id) { restaurant in
                GridCard(restaurant: restaurant)
            }
        }
    }
}

#Preview {
    GridCardView(restaurants: restaurants)
}
