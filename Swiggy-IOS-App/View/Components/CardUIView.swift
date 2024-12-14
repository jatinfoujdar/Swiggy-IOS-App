import SwiftUI


struct Option: Identifiable {
    let id = UUID()
    var optionId: String
    var url: String
}

struct CardUIView: View {
    let options: [Option] = [
        Option(optionId: "1", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029856/PC_Creative%20refresh/3D_bau/banners_new/Pizza.png"),
        Option(optionId: "2", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029845/PC_Creative%20refresh/3D_bau/banners_new/Burger.png"),
        Option(optionId: "3", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029848/PC_Creative%20refresh/3D_bau/banners_new/Chinese.png"),
        Option(optionId: "4", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029858/PC_Creative%20refresh/3D_bau/banners_new/Rolls.png"),
        Option(optionId: "5", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029858/PC_Creative%20refresh/3D_bau/banners_new/Pure_Veg.png"),
        Option(optionId: "6", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029860/PC_Creative%20refresh/3D_bau/banners_new/Sandwich.png"),
        Option(optionId: "7", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1674029847/PC_Creative%20refresh/3D_bau/banners_new/Kachori.png"),
        Option(optionId: "8", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/v1675667625/PC_Creative%20refresh/Biryani_2.png"),
    ]
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
              Text("Jatin, What's On Your Mind  ─────")
              .font(.headline)
            
      }
      .padding(.horizontal)
            
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(options.indices, id: \.self) { index in
                    VStack {
                        AsyncImage(url: URL(string: options[index].url)) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 120)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                      }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CardUIView()
}
