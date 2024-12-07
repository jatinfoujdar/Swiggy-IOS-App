import SwiftUI

struct RestaurantListView: View {
    var restaurants: [Restaurant]

    var body: some View {
        VStack {
            HeaderView()
                ScrollView {
                
                CardCrousal()
                GridCardView(restaurants: restaurants)
                CardUIView()
                StickyFilterView()
                VStack(spacing: 10) {
                    ForEach(restaurants, id: \.id) { restaurant in
                        RestaurantCardView(restaurant: restaurant)
                    }
                }
                .padding()
            }

            NavbarView() 
        }
    }
}

#Preview {
    RestaurantListView(restaurants: restaurants)
}
