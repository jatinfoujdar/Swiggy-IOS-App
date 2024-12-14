import SwiftUI



struct ButtonView: View {
    var body: some View {
        
        HStack(spacing: 10) {
            Button(action: {
                print("What's New? tapped!")
            }) {
                Text("What's New?")
                    .font(.caption)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            
            Button(action: {
                print("Gourmet Delight tapped!")
            }) {
                Text("Gourmet Delight")
                    .font(.caption)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            
            
            Button(action: {
                print("Fast Delivery tapped!")
            }) {
                Text("Fast Delivery")
                    .font(.caption)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
        .padding()
    }
}

struct GridCardView: View {
    
    var restaurants: [Restaurant]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
          VStack(alignment: .leading) {
              HStack {
                Text("Top Pick For You ─────")
                .font(.headline)
              
        }
        .padding(.horizontal)
                
            ButtonView()
                
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(restaurants.prefix(6), id: \.id) { restaurant in
                    GridCard(restaurant: restaurant)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridCardView(restaurants: restaurants)
}
