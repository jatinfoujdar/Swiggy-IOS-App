import SwiftUI

struct Exeser: View {
    @State private var imageOffset: CGFloat = -25
    @State private var isImageMovedUp = false

    var body: some View {
        ZStack {

            Image("swiggy-card")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 210)
                .clipped()
                .offset(y: imageOffset)

        
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 350, height: 270)
                    .cornerRadius(10)
                    .offset(y: 50)
                    .overlay(
                        VStack {
                            Text("Delicious Food Awaits!")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                            
                            Text("Order now and enjoy amazing deals.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                        }
                            .padding(.top, 50) // Adjust this for better spacing
                    )
            }
        }
        .onTapGesture {
            
            withAnimation(.easeInOut(duration: 0.5)) {
                if isImageMovedUp {
                    imageOffset = -25
                } else {
                    imageOffset = -180
                }
                isImageMovedUp.toggle()
            }
        }
        .border(.black)
    }
}

#Preview {
    Exeser()
}
