import SwiftUI

struct CardView: View {
    @State private var isImageEnlarged: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .shadow(color: Color.gray.opacity(0.2), radius: 5)

            VStack(alignment: .leading, spacing: 15) {
                Text("Preferred Payment")
                    .font(.headline)
                    .padding(.top, 15)
                    .padding(.horizontal, 20)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Tap to View")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .onTapGesture {
                            withAnimation {
                                isImageEnlarged.toggle()
                            }
                        }

                    HStack {
                        Image("hdfccard")
                            .resizable()
                            .scaledToFit()
                            .frame(height: isImageEnlarged ? 200 : 20) 
                            .animation(.easeInOut, value: isImageEnlarged)
                    }
                    .padding(.horizontal)

                    DottedLine()

                    HStack {
                        Image(systemName: "shield.lefthalf.fill")
                        Text("Credit Card")
                        Spacer()
                        Text("...8822")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .frame(width: 300, height: 200)
    }
}

#Preview {
    CardView()
}
