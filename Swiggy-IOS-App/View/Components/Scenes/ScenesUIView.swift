import SwiftUI

struct ScenesUIView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
            VStack{
                HeadersView()
            
                Spacer()
                CardWithInsetCorners(label: "Concert", image: Image("images"))
                   
                Spacer()
                SceneNavbarView()
            }
        }
    }
}

#Preview {
    ScenesUIView()
}
