import SwiftUI

struct LandingView: View {
    @State private var moveImage = false
    @State private var floatEffect = false

    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)

            Image("logo1")
            .resizable()
            .frame(width: 300, height: 100)
            .offset(y: -UIScreen.main.bounds.height / 2.8)
       
            Image("hero-img")
                .resizable()
                .frame(width: 350, height: 450)
            
        
            Image("food1")
                .resizable()
                .frame(width: 140, height: 90)
                .offset(x: 149, y: moveImage ? 10 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
           
            Image("SeekPng")
                .resizable()
                .frame(width: 150, height: 100)
                .offset(x: 140, y: moveImage ? -110 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
          
            Image("food2")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? -160 : 100, y: moveImage ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
           
            Image("food3")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? -140 : 100, y: moveImage ? 170 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
           
            Image("food5")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? 2 : 100, y: moveImage ? 210 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
           
            Image("food4")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? 150 : 100, y: moveImage ? 150 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
          
            Image("food6")
                .resizable()
                .frame(width: 150, height: 100)
                .offset(x: -150, y: moveImage ? -80 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
                .offset(y: floatEffect ? -5 : 5)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatEffect)
            
            
            VStack {
                Spacer()
                Button(action: {
                print("Button tapped")
                }) {
                Text("Start ordering")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding()
                .padding(.horizontal,100)
                .background(Color.orange)
                .cornerRadius(30)
                    
                }
                .padding(.bottom, 20)
            }
        }
        .onAppear {
                 
                 withAnimation(.easeInOut(duration: 2)) {
                     moveImage.toggle()
                 }
                
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                     floatEffect.toggle()
                 }
             }
         }
     }

#Preview {
    LandingView()
}
