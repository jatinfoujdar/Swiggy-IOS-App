
import SwiftUI

import SwiftUI

struct CategoryCardView: View {
    

    var body: some View {
        VStack {
            Image("")
                .resizable()
                .frame(width: 40, height: 40)
            Text("sff")
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(width: 100, height: 120)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    CategoryCardView()
}
