import SwiftUI

struct ScrollableCircleImagesView: View {
    let images = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4)
                        )
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
        .background(Color("BackgroundColor"))
    }
}



#Preview {
    ScrollableCircleImagesView()
}
