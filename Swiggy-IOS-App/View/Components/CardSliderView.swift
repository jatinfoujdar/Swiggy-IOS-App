import SwiftUI
import Lottie

struct CardSliderView: View {
  
    
    var body: some View {
        ZStack{
            Color.orange
            LottieView(animation: .named("confetti"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .frame(width: 200, height: 200)
            VStack{
                Image("logow")
               
                HStack{
                    VStack{
                        Text("Swiggy HDFC Bank Credit Card")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                        
                        Button("Done"){
                            print("sdfsd")
                        }
                        .foregroundStyle(.black)
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .font(.title2)
                      
                        
                    }
                    Image("cardsss")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                HStack{
                                  
                    VStack {
                        LottieView(animation: .named("smartphone-payment"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                            .frame(width: 200, height: 200)
                        
                        Text("Easy Payments")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    
                    VStack {
                        LottieView(animation: .named("truck-delivery-service"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                            .frame(width: 200, height: 200)
                        
                        Text("Fast Deliveries")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                }
                
                HStack{
                   
                    VStack {
                        LottieView(animation: .named("girl-holding-bag"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                            .frame(width: 200, height: 200)
                        
                        Text("Exclusive Offers")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    
                    VStack {
                        LottieView(animation: .named("fast-shopping-delivery"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                            .frame(width: 200, height: 200)
                        
                        Text("Reward Points")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CardSliderView()
}
