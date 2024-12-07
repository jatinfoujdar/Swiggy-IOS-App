import SwiftUI

struct CarouselImage: Identifiable {
    let id: String
    let url: String
}

struct CardCrousal: View {
   
    let images = [
        CarouselImage(id: "CarouselImages1", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_850,h_504/rng/md/carousel/production/8e3c441579fe371299ea23001551643f"),
        CarouselImage(id: "CarouselImages2", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_850,h_504/rng/md/carousel/production/5c5330b7210697c6dca6303647c64827"),
        CarouselImage(id: "CarouselImages3", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_850,h_504/rng/md/carousel/production/5ad8ba771574ca22f2502e6f5528d1e6"),
        CarouselImage(id: "CarouselImages4", url: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_850,h_504/rng/md/carousel/production/7387e31ecea03420ef6993cfafc6784c")
    ]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(images) { image in
                    AsyncImage(url: URL(string: image.url)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 350, height: 130)
                        case .success(let img):
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width: 350, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                        case .failure:
                            Color.gray
                                .frame(width: 350, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CardCrousal()
}
