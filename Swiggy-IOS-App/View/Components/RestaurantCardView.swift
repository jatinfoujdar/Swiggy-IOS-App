import SwiftUI


struct RestaurantCardView: View {
    var restaurant: Restaurant
    
    var body: some View {
     
        NavigationLink(destination: RestaurantDetailedView(restaurant: restaurant)) {
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
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text(restaurant.cuisines.prefix(2).joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text("\(restaurant.avgRating, specifier: "%.1f") Stars")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    Text(restaurant.costForTwo)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    
                }
                .padding(.top, 8)
                Spacer()
                Image(systemName: "heart")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    RestaurantCardView(restaurant: restaurants[0])
}
