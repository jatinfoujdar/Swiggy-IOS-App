import SwiftUI

struct RestaurantDetailedView: View {
    var restaurant: Restaurant
   

    var body: some View {
        VStack(spacing: 0) {
            restaurantImage

            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    restaurantDetails
                        .padding()
                    additionalDetails
                    
                    hostInfo
                    
                    pricingAndReservation
                        
                }
                .padding(.horizontal)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }



    private var restaurantImage: some View {
        if let imageUrl = URL(string: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/\(restaurant.cloudinaryImageId)") {
            return AnyView(
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
            )
        } else {
            return AnyView(EmptyView())
        }
    }

    private var restaurantDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(restaurant.name)
                .font(.largeTitle)
                .fontWeight(.bold)
               
            Text("Agdamba Fuel Company, Vinayak Marg")
                .fontWeight(.semibold)

            Text("2 guest . 1 Bedroom . 1 bed . 1 bath")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var additionalDetails: some View {
        HStack(spacing: 16) {
            detailItem(title: "4.96", subtitle: "168 Reviews", image: nil, imageColor: .clear)
            Divider()
            detailItem(title: nil, subtitle: "Eco-friendly", image: "leaf", imageColor: .green)
            Divider()
            detailItem(title: nil, subtitle: "Top Rated", image: "star.fill", imageColor: .yellow)
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }

    private func detailItem(title: String?, subtitle: String, image: String?, imageColor: Color) -> some View {
        VStack {
            if let title = title {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            if let image = image {
                Image(systemName: image)
                    .font(.title3)
                    .foregroundColor(imageColor)
            }
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }

    private var hostInfo: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("host")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text("Hosted by Cito")
                    .font(.headline)

                Text("Superhost · 8 years hosting")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }

    private var pricingAndReservation: some View {
    
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("16000")
                    .font(.subheadline)
                    .strikethrough()
                    .foregroundColor(.gray)

                Text("400 / night")
                    .font(.title3)
                    .fontWeight(.bold)
            }

            Spacer()

            Button(action: {
                print("Reserve button tapped")
            }) {
                Text("Reserve")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 150)
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    RestaurantDetailedView(restaurant: restaurants[0])
}
