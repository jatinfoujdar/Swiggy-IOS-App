import SwiftUI

struct Exeser: View {
    @State private var imageOffset: CGFloat = -30
    @State private var isImageMovedUp = false

    var body: some View {
        Text("Tap to View Card")
            .foregroundColor(.gray)
        
        ZStack {
            Image("swiggy-card")
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
                            HStack{
                                Image("CRED-LOGO")
                                    .resizable()
                                    .frame(width: 100, height: 50)
                                Text("Credit Card | .... 8822")
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
                                    .border(.black)
                                
                                Image("CRED-LOGO")
                                    .resizable()
                                    .frame(width: 70, height: 30)
                                    .border(.black)
                                
                            }
                        }
                            .padding(.bottom,40)
                    )
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isImageMovedUp.toggle()
                imageOffset = isImageMovedUp ? -180 : -30
            }
        }
        .shadow(radius: 0.8)
    }
}

#Preview {
    Exeser()
}
