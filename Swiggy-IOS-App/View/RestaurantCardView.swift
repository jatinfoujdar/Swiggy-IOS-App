import SwiftUI

struct RestaurantCardView: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if let imageUrl = URL(string: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/\(restaurant.cloudinaryImageId)") {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(12)
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(restaurant.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(restaurant.cuisines.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(restaurant.avgRating, specifier: "%.1f") Stars")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                
                Text(restaurant.costForTwo)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
            }
            .padding(.top, 8)
        }
        .padding() 
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}

#Preview {
    RestaurantCardView(restaurant: Restaurant(id: "1", name: "Patna Biryani Club", locality: "Patna", areaName: "Sri Krishnapuri", costForTwo: "₹350 for two", cuisines: ["Pizza", "Italian"], avgRating: 4.3, totalRatingsString: "5.0K+", deliveryTime: 30, lastMileTravel: 5.0, slaString: "30-35 min", lastMileTravelString: "5 km", isOpen: true, cloudinaryImageId: "oamsqzmmt2xt2eaqqt2p"))
}
