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
                    .frame(width: 200,height: 200)
                Spacer()
                SceneNavbarView()
            }
        }
    }
}

#Preview {
    ScenesUIView()
}
