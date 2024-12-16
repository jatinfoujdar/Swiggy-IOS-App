import SwiftUI

struct CardView: View {
    @State private var isImageExpanded = false 

    var body: some View {
        VStack(alignment: .leading) {
            Text("Preferred Payment")
                .font(.headline)
                .padding(.leading)

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.4), radius: 5)
                
                preferredPaymentView
            }
            .padding()
            .frame(width: 400, height: isImageExpanded ? 250 : 150)
            .animation(.easeInOut, value: isImageExpanded)
        }
    }

    private var preferredPaymentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                Image("swiggy-card")
                    .resizable()
                    .scaledToFit()
                    .frame(height: isImageExpanded ? 180 : 50)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                    .onTapGesture {
                        isImageExpanded.toggle()
                    }
            }
            .frame(maxWidth: .infinity)

            if !isImageExpanded {
                Text("Credit Card | .... 8822")
                    .font(.subheadline)
                    .padding(.top, 5)
            }
        }
        .padding()
    }
}

#Preview {
    CardView()
}

