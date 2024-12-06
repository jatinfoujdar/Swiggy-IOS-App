import SwiftUI

struct NavbarView: View {
    let iconNames = [
        ("arrowshape.backward.circle", "Home"),
        ("fork.knife.circle", "Food"),
        ("bookmark", "Eatlist"),
        ("icons8-rocket-64", "Bolt"),
        ("creditcard", "Card"),
        ("cart", "Cart")
    ]
    
    var body: some View {
        HStack {
            ForEach(iconNames, id: \.0) { icon in
                VStack {
                    // Icon
                    if icon.0.contains("icons8-rocket-64") {
                        Image(icon.0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    } else {
                        Image(systemName: icon.0)
                            .font(.system(size: 25))
                            .frame(width: 25, height: 25)
                    }
                    
                  
                    Text(icon.1)
                        .font(.caption)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    NavbarView()
}
