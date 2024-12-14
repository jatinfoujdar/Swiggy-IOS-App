import SwiftUI

struct NavbarView: View {
    @State var  showExchangeInfo = false
    @State var showCart = false
    
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
                    if icon.0.contains("icons8-rocket-64") {
                        Image(icon.0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(icon.1 == "Food" ? .orange : .black)
                    } else {
                        Image(systemName: icon.0)
                            .font(.system(size: 25))
                            .frame(width: 25, height: 25)
                            .foregroundColor(icon.1 == "Food" ? .orange : .black)
                    }
                    
                    if icon.1 == "Card" {
                        Button(action: {
                            showExchangeInfo.toggle()
                            print("Card button pressed")
                        }) {
                            Text(icon.1)
                                .font(.caption)
                                .foregroundColor(icon.1 == "Food" ? .orange : .black)
                                .padding(.horizontal, 8)
                                .sheet(isPresented: $showExchangeInfo){
                                    CardSliderView()
                                }
                                
                        }
                    } else if icon.1 == "Cart" {
                        NavigationLink(destination: CartView()) {
                            Text(icon.1)
                                .font(.caption)
                                .foregroundColor(icon.1 == "Food" ? .orange : .black)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            showCart.toggle()
                        })
                       
                    } else {
                        Text(icon.1)
                            .font(.caption)
                            .foregroundColor(icon.1 == "Food" ? .orange : .black)
                    }
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
