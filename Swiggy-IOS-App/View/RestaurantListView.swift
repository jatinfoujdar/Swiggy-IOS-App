import SwiftUI

struct RestaurantListView: View {

    var restaurants: [Restaurant]  

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(restaurants, id: \.id) { restaurant in
                
                    RestaurantCardView(restaurant: restaurant)
                }
            }
            .padding()
        }
    }
}

#Preview {
    RestaurantListView(restaurants: restaurants)
}
