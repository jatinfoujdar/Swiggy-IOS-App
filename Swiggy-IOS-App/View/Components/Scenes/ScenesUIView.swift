import SwiftUI

struct ScenesUIView: View {
    let label = ["Music","Hobbies","Games","Performing"]
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)

            VStack {
                HeadersView()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(label , id: \.self) { index in
                            CardWithInsetCorners(label: index, image: Image("images"))
                                .frame(width: 230)
                        }
                    }
                    .padding()
                }

                Spacer()

                SceneNavbarView()
            }
        }
    }
}

#Preview {
    ScenesUIView()
}
