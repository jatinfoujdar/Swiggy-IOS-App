import SwiftUI

struct ShimmerUIView: View {
    @State private var animationOffset: CGFloat = -1.0

    var body: some View {
        ZStack {
           
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 100)
            
     
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.7), Color.clear]),
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(height: 100)
                .rotationEffect(.degrees(30))
                .offset(x: animationOffset * 300)
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: false)
                    ) {
                        animationOffset = 1.0
                    }
                }
        }
        .clipped()
    }
}



#Preview {
    ShimmerUIView()
}
 
