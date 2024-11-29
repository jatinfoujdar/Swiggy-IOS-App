import SwiftUI

struct LandingView: View {
    @State private var moveImage = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            Image("logo")
            .resizable()
            .frame(width: 150, height: 50)
            .offset(y: -UIScreen.main.bounds.height / 2.5)
       
            Image("hero-img")
                .resizable()
                .frame(width: 350, height: 450)
            
        
            Image("food1")
                .resizable()
                .frame(width: 150, height: 100)
                .offset(x: 150, y: moveImage ? 10 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)

           
            Image("SeekPng")
                .resizable()
                .frame(width: 150, height: 100)
                .offset(x: 140, y: moveImage ? -120 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
          
            Image("food2")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? -160 : 100, y: moveImage ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
           
            Image("food3")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? -140 : 100, y: moveImage ? 170 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
           
            Image("food5")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? 2 : 100, y: moveImage ? 210 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
           
            Image("food4")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: moveImage ? 150 : 100, y: moveImage ? 150 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
          
            Image("food6")
                .resizable()
                .frame(width: 150, height: 100)
                .offset(x: -150, y: moveImage ? -80 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: moveImage)
            
            
            VStack {
                Spacer()
                Button(action: {
                print("Button tapped")
                }) {
                Text("Get Started")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
                }
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            moveImage.toggle()
        }
    }
}

#Preview {
    LandingView()
}
