import SwiftUI

struct LandmarkRow: View {

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
    LandmarkRow(restaurants: restaurants)
}
