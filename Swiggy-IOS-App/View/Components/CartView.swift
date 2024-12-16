import SwiftUI

struct CartView: View {
    @State private var selectedDeliveryOption = "Standard"
    @State private var cartItems: [CartItem] = [
        CartItem(name: "Farmhouse Cheese Burst", details: "Cheese Burst, Regular", price: 125, quantity: 1)
    ]
    @State private var totalAmount: Double = 140

    var body: some View {
        VStack {
       
           
                ForEach($cartItems) { $item in
                    CartItemView(item: $item, onUpdate: updateTotalAmount)
                        .padding(.horizontal)
                }
            ScrollView {
                VStack{
                    HStack{
                        Text("Prefered Payment")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                    Text("Tap to View Card")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    
                    TaptoView(cardImage: "bankcard")
                    TaptoView(cardImage: "blackcard")
                    TaptoView(cardImage: "swiggy-card")
                }
            }
                
              
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Delivering superfast!")
//                        .font(.headline)
//                    
//                    DeliveryOptionView(
//                        title: "Standard",
//                        description: "Minimal order grouping",
//                        time: "20-25 mins",
//                        isSelected: selectedDeliveryOption == "Standard",
//                        action: { selectedDeliveryOption = "Standard" }
//                    )
//                    
//                    DeliveryOptionView(
//                        title: "Eco Saver",
//                        description: "Lesser CO2 by order grouping",
//                        time: "25-30 mins",
//                        isSelected: selectedDeliveryOption == "Eco Saver",
//                        action: { selectedDeliveryOption = "Eco Saver" }
//                    )
//                }
//                .padding()
                
                Divider()
                Spacer()
                
                
                HStack {
                    Text("Reward Progress")
                        .font(.subheadline)
                        .bold()
                    Spacer()
                    Text("\(Int(totalAmount))/300")
                        .font(.caption)
                }
                .padding(.horizontal)
                
                ProgressBar(value: min(totalAmount / 300, 1))
                    .frame(height: 10)
                    .padding(.horizontal)
                
                Spacer()
                
                
                VStack(spacing: 10) {
                    HStack {
                        Text("To Pay")
                            .font(.headline)
                        Spacer()
                        Text("\u{20B9}165  \u{20B9}140")
                            .font(.subheadline)
                            .strikethrough()
                            .foregroundColor(.gray)
                        Text("\u{20B9}140")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    
                    HStack {
                        Text("\u{20B9}25 saved on the total!")
                            .font(.subheadline)
                            .foregroundColor(.green)
                        Spacer()
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Pay \u{20B9}278")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            .padding()
            .background(Color(.systemGray6))
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    func updateTotalAmount(_ item: CartItem) {
        totalAmount = cartItems.reduce(0) { $0 + (Double($1.price) * Double($1.quantity)) }
    }
}

struct ProgressBar: View {
    var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(.systemGray5))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: CGFloat(value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(value >= 1.0 ? .green : .blue)
            }
        }
    }
}

struct DeliveryOptionView: View {
    var title: String
    var description: String
    var time: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            Button(action: action) {
                HStack(spacing: 10) {
                    Circle()
                        .stroke(isSelected ? Color.green : Color.gray, lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Circle()
                                .fill(isSelected ? Color.green : Color.clear)
                                .frame(width: 12, height: 12)
                        )

                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.subheadline)
                            .bold()
                        Text(description)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(time)
                        .font(.caption)
                }
            }
        }
        
    }
}
struct CartItemView: View {
    @Binding var item: CartItem
    let onUpdate: (CartItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.subheadline)
                        .bold()
                    Text(item.details)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Spacer()

                HStack {
                    Button(action: {
                        if item.quantity > 1 {
                            item.quantity -= 1
                            onUpdate(item)
                        }
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    Text("\(item.quantity)")
                        .padding(.horizontal)
                    Button(action: {
                        item.quantity += 1
                        onUpdate(item)
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
                .font(.title3)

                Text("\u{20B9}\(item.price)")
                    .font(.subheadline)
            }

            HStack {
                Button("Cooking requests") {
                    
                }
                .font(.caption)
                .foregroundColor(.blue)

                Spacer()

                Button("Add more items") {
             
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
        CartView()
}
