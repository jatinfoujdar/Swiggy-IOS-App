import SwiftUI

struct RestaurantListView: View {
    var restaurants: [Restaurant]
    @State private var isLoading = true
    @State private var isRefreshing = false
    
    var body: some View {
            NavigationView {
                      VStack {
                          HeaderView()
                    ScrollView {
                    
                        if isLoading || isRefreshing {
                            ShimmerGridView()
                        } else {
                            CardCrousal()
                        }
                        
                        if isLoading || isRefreshing {
                            ShimmerGridView()
                        } else {
                            GridCardView(restaurants: restaurants)
                        }
                        
                        if isLoading || isRefreshing {
                            ShimmerUIView()
                        } else {
                            CardUIView()
                        }
                        
                        if isLoading || isRefreshing {
                            ShimmerGridView()
                        } else {
                            StickyFilterView()
                        }
                        
                        VStack(alignment: .leading){
                            HStack {
                                Text("Tap for deatiled View ──────────")
                                    .font(.headline)
                            }
                            .padding()
                        }
                        
                        if isLoading || isRefreshing {
                            ShimmerGridView()
                        } else {
                            VStack(spacing: 10) {
                                ForEach(restaurants, id: \.id) { restaurant in
                                    NavigationLink(destination: RestaurantDetailedView(restaurant: restaurant)) {
                                        RestaurantCardView(restaurant: restaurant)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .refreshable {
                        await refreshData()
                    }
                          NavbarView()
                }
            }
            .onAppear {
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
        }
    
    func refreshData() async {
        isRefreshing = true
        isLoading = true
        
      
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        
        
        isLoading = false
        isRefreshing = false
    }
}

#Preview {
    RestaurantListView(restaurants: restaurants)
}
