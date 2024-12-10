import SwiftUI

struct RestaurantListView: View {
    var restaurants: [Restaurant]

    var body: some View {
         NavigationView {
             VStack {
                 HeaderView()
                 ScrollView {
                     CardCrousal()
                     GridCardView(restaurants: restaurants)
                     CardUIView()
                     StickyFilterView()
                     VStack(alignment: .leading){
                     HStack {
                         Text("Tap for deatiled View ──────────")
                             .font(.headline)
                         
                     }
                     .padding()
                 }
                     VStack(spacing: 10) {
                         ForEach(restaurants, id: \.id) { restaurant in
                           
                             NavigationLink(destination: RestaurantDetailedView(restaurant: restaurant)) {
                                 RestaurantCardView(restaurant: restaurant)
                             }
                         }
                     }
                     .padding()
                 }
                 NavbarView()
             }
         }
     }
 }

#Preview {
    RestaurantListView(restaurants: restaurants)
}
