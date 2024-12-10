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
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Agdamba Fuel Company, Vinayak Marg")
                        .fontWeight(.semibold)
                    
                    Text("2 guest . 1 Bedroom . 1 bed . 1 bath")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding()
                    HStack(spacing: 16) {
                        VStack {
                            Text("4.96")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("168 Reviews")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                        
                        VStack {
                            Image(systemName: "leaf")
                                .font(.title3)
                                .foregroundColor(.green)
                            Text("Eco-friendly")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                        
                        VStack {
                            Image(systemName: "star.fill")
                                .font(.title3)
                                .foregroundColor(.yellow)
                            Text("Top Rated")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    
                    HStack(spacing: 16) {
                        Image("host")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Hosted by Cito")
                                .font(.headline)
                            
                            Text("Superhost · 8 years hosting")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("₹16,012")
                                .font(.subheadline)
                                .strikethrough()
                                .foregroundColor(.gray)
                            
                            Text("₹14,410 / night")
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
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    RestaurantDetailedView(restaurant: restaurants[0])
}
