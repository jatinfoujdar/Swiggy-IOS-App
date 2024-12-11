import SwiftUI
import Lottie

struct CardSliderView: View {
  
    
    var body: some View {
        ZStack{
            Color.orange
            .ignoresSafeArea()
            VStack{
                LottieView(animation: .named("fast-shopping-delivery"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .frame(width: 300, height: 300)
            }
        }
    }
}

#Preview {
    CardSliderView()
}
