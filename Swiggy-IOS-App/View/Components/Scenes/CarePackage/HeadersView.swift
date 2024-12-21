import SwiftUI

struct HeadersView: View {
    var body: some View {
        HStack {
            Image(systemName: "menucard")
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                )
            Spacer()
            VStack {
                Text("sdfsdfsdfdsfsfssfs")
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "bell")
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                )
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    HeadersView()
}
