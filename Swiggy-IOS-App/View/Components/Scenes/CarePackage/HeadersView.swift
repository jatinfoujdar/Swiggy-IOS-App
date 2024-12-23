import SwiftUI

struct HeadersView: View {
    let images = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Top Navigation Bar
            HStack {
                Button(action: {
                    // Menu button action
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .foregroundColor(.white)
                    Text("Bangalore, India")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    // Notification button action
                }) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            // Header Title
            Text("Plan Your Best Event")
                .font(.custom("American Typewriter", size: 30))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            // Subtitle
            Text("Explore the Best Events Around You.")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            // Horizontal Scroll View with Circles
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80) // Adjust circle size
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ), lineWidth: 4)
                            )
                            .shadow(radius: 5) // Optional shadow for effect
                            .padding(.vertical)
                    }
                }
                .padding(.horizontal)
            }
            
            // Search Bar
            HStack {
                TextField("Find interesting events", text: .constant(""))
                       .padding(.vertical, 10)
                       .padding(.horizontal, 16)
                       .background(Color.white)
                       .cornerRadius(8)
                       .foregroundColor(.black)
                       .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                Button(action: {
                    // Search button action
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
      
            HStack {
                Text("All Events")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                   
                }) {
                    Text("See All")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .padding(.top)
       
    }
}

struct HeadersView_Previews: PreviewProvider {
    static var previews: some View {
        HeadersView()
            .previewDevice("iPhone 14 Pro")
    }
}
