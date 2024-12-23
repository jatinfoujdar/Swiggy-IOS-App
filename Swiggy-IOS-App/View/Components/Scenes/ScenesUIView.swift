import SwiftUI

struct ScenesUIView: View {
    let label = ["Music", "Hobbies", "Games", "Performing"]
    let images = ["jb1", "jb2", "jb3", "jb1"] 

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.orange]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)

                VStack {
                    HeadersView()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<label.count, id: \.self) { index in
                                NavigationLink(destination: CardDetailsViews(label: label[index], image: Image(images[index]))) {
                                    CardWithInsetCorners(label: label[index], image: Image(images[index]))
                                        .frame(width: 230)
                                }
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
}

#Preview {
    ScenesUIView()
}
