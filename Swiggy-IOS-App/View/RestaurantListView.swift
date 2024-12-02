import SwiftUI

struct LandmarkRow: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            // Construct the full URL for the image
            let imageUrl = "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/\(restaurant.cloudinaryImageId)"
            
            // Display the restaurant image
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 50, height: 50)
            }

            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text("\(restaurant.locality), \(restaurant.areaName)")
                    .font(.subheadline)
                Text("₹\(restaurant.costForTwo) for two")
                    .font(.caption)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LandmarkRow(restaurant: restaurants[0])
}
