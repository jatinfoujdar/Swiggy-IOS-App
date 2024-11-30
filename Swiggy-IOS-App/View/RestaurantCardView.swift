import SwiftUI

struct RestaurantCardView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/e0839ff574213e6f35b3899ebf1fc597")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(16)
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            }
            
            Text("Chinese Ninja")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 8)
            
            Text("Noodles, Chinese, Asian")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 2)
            
            Text("4.4 Stars")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.green)
                .padding(.top, 2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        
    }
}

#Preview {
    RestaurantCardView()
}
