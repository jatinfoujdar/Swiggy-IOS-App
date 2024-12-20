import SwiftUI

struct  RecommendationView: View {

   let items: [(imageName: String, title: String)] = [
       ("bakery", "Bakery"),
       ("bread", "Bread"),
       ("fruit", "Fruit"),
       ("goat-milk", " Milk"),
       ("ice", "Sweets"),
       ("meat", "Meat"),
       ("Organic", "Organic"),
       ("cleaner", "Cleaner")
   ]
   
   var body: some View {
       VStack(alignment: .leading) {
                    
           ScrollView(.horizontal, showsIndicators: false) {
               LazyHStack(spacing: 20) {
                   ForEach(items, id: \.imageName) { item in
                       RecommendationItemView(imageName: item.imageName, title: item.title)
                   }
               }
               .padding(.horizontal)
           }
       }
   }
}

#Preview {
   RecommendationView()
}
