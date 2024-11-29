import Foundation

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isLoading = false
    
    
    let urlString = "https://food-wagon-backend.onrender.com/api/restaurants?lat=25.61011402528211&lng=85.116419903934"
    
    
    func fetchRestaurants() {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
   
        URLSession.shared.dataTask(with: url) { data, response, error in
     
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                self.isLoading = false
                return
            }
            
           
            guard let data = data else {
                print("No data received")
                self.isLoading = false
                return
            }
            
           
            let decoder = JSONDecoder()
            do {
                let restaurantResponse = try decoder.decode(RestaurantResponse.self, from: data)
                DispatchQueue.main.async {
                   
                    self.restaurants = restaurantResponse.data.restaurants
                    self.isLoading = false
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                self.isLoading = false
            }
        }.resume()
    }
}
