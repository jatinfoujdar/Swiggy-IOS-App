import SwiftUI

struct GridCard: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
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
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(8)
            }
            Text(restaurant.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .lineLimit(2)
                .truncationMode(.tail)
            HStack {
                Image("star")
                Text("\(restaurant.avgRating, specifier: "%.1f") star")
            }
            .fontWeight(.bold)
            .font(.caption)
            Text(restaurant.cuisines.first ?? "")
                .foregroundColor(.gray)
                .lineLimit(1)
        }
        .padding() 
    }
}

#Preview {
    GridCard(restaurant: restaurants[0])
}
