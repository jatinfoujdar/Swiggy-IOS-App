import SwiftUI
import Lottie

struct CardSliderView: View {
  
    
    var body: some View {
        ZStack{
            Color.orange
            .ignoresSafeArea()
            VStack{
                Image("logow")
                HStack{
                    Text("Swiggy HDFC Bank Credit Card")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Image("cardsss")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                .padding()
                
                HStack{
                    LottieView(animation: .named("fast-shopping-delivery"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .frame(width: 300, height: 300)
               
                }
            }
        }
    }
}

#Preview {
    CardSliderView()
}
