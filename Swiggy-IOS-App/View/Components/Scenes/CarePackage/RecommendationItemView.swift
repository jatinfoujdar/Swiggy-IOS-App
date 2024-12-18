import SwiftUI

struct RecommendationItemView: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 70, height: 70)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }

            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 80) 
    }
}

#Preview {
    RecommendationItemView(imageName: "bakery", title: "Bakery")
}
