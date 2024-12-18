import SwiftUI

struct TaptoView: View {
    @State private var imageOffset: CGFloat = -30
    @State private var isImageMovedUp = false
    var cardImage : String

    var body: some View {
        ZStack {
            Image(cardImage)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 210)
                .clipped()
                .offset(y: imageOffset)
            
            ZStack {
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 355, height: 170)
                    .cornerRadius(10)
                    .offset(y: -10)
                    .overlay(
                        VStack {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    isImageMovedUp.toggle()
                                    imageOffset = isImageMovedUp ? -180 : -30
                                }
                            }) {
                                Text("Tap to View Card")
                                    .foregroundColor(.gray)
                            }
                            
                            Divider()
                            HStack{
                                Image("CRED-LOGO")
                                    .resizable()
                                    .frame(width: 100, height: 50)
                                Text("Credit Card | .... 8321")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "creditcard.circle")
                                    .padding()
                            }
                          
                            HStack{
                                Image("hdcf")
                                    .resizable()
                                    .frame(width: 70, height: 30)
                                    .border(.gray)
                                
                                Image("CRED-LOGO")
                                    .resizable()
                                    .frame(width: 70, height: 30)
                                    .border(.gray)
                                
                            }
                        }
                            .padding(.bottom,40)
                    )
            }
        }
        .shadow(radius: 0.8)
    }
}

#Preview {
    TaptoView(cardImage: "swiggy-card")
}
