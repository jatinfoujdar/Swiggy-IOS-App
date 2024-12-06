import SwiftUI

struct CardCrousal: View {
    let imgNames = [
        "b1",
        "b2"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(imgNames, id: \.self) { imgName in
                    Image(imgName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CardCrousal()
}
