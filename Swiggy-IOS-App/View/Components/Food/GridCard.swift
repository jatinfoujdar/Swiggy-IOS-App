import SwiftUI
import AVKit

struct GridCard: View {
    var restaurant: Restaurant
    @State private var isVideoPlaying = false
    @State private var tapCount = 0

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                
                if isVideoPlaying {
                    VideoPlayerView(fileName: "video2")
                        .frame(width: 120, height: 120)
                        .cornerRadius(12)
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                } else {
                    if let imageUrl = URL(string: "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/\(restaurant.cloudinaryImageId)") {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipped()
                                .cornerRadius(12)
                                .shadow(radius: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.red, lineWidth: 4) // Red border
                                )
                               
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                }
                
                // Heart icon
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(8)
            }
            
            // Restaurant name
            Text(restaurant.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .lineLimit(2)
                .truncationMode(.tail)
            
            // Rating and cuisine
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
        .onTapGesture {
            tapCount += 1
            if tapCount % 2 == 1 {
                isVideoPlaying = true
            } else {
                isVideoPlaying = false
            }
        }
    }
}

struct VideoPlayerView: View {
    var fileName: String
    
    var body: some View {
        VStack {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "mp4") {
                AVPlayerControllerRepresentable(player: AVPlayer(url: url))
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Video not found")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}

struct AVPlayerControllerRepresentable: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.player = player
        return playerController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if player.timeControlStatus == .paused {
            player.play()
        }
    }
}

#Preview {
    GridCard(restaurant: restaurants[0])
}
