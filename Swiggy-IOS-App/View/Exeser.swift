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
            
            HStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 350, height: 270)
                    .cornerRadius(10)
                    .offset(y: 50)
                    .overlay(
                        HStack {
                            Image("CRED-LOGO")
                                .resizable()
                                .frame(width: 100, height: 50)
                            Text("Credit Card | .... 8822")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            Spacer()
                        }
                            .padding(.bottom, 80)
                    )
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isImageMovedUp.toggle()
                imageOffset = isImageMovedUp ? -180 : -30
            }
        }
        
    }
}

#Preview {
    Exeser()
}
