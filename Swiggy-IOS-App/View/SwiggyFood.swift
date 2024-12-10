import SwiftUI

struct FoodDeliveryAppView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Header Section
                VStack(alignment: .leading) {
                    Text("Delivering to")
                        .font(.caption)
                        .foregroundColor(.gray)
                    HStack {
                        Text("Current Location")
                            .font(.headline)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "chevron.down")
                                .foregroundColor(.orange)
                        }
                    }
                }
                .padding(.horizontal)

                // Search Bar
                HStack {
                    TextField("Search for food or restaurants", text: .constant(""))
                        .padding(.leading, 8)
                        .padding(.vertical, 10)
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                )
                .padding(.horizontal)

                // Categories Scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(["Offers", "Newly Launched", "Top Rated", "Best Sellers"], id: \.self) { category in
                            Text(category)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.orange.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal)
                }

                // Food List
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(1...10, id: \.self) { _ in
                            HStack(spacing: 16) {
                                // Image
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Text("Image")
                                            .foregroundColor(.white)
                                            .font(.caption)
                                    )
                                
                                // Food Info
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Restaurant/Food Name")
                                        .font(.headline)
                                    Text("Description or additional details")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("$Price / Rating")
                                        .font(.subheadline)
                                        .foregroundColor(.orange)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray6))
                            )
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Swiggy")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FoodDeliveryAppView()
}
