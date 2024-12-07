import SwiftUI

struct RestaurantDetailedView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            
            if let imageUrl = URL(string: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/\(restaurant.cloudinaryImageId)") {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
                .edgesIgnoringSafeArea(.top)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(restaurant.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(restaurant.cuisines.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Rating: \(restaurant.avgRating, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.green)
                    
                    Text("Cost for two: \(restaurant.costForTwo)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    RestaurantDetailedView(restaurant: restaurants[0])
}
