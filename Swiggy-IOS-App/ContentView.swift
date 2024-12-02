

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(restaurants) { restaurant in
//            LandmarkRow(restaurant: restaurant)
            RestaurantCardView(restaurant: restaurant)
        }
    }
}

#Preview {
    ContentView()
}
