import SwiftUI

struct HeadersView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
           
            HStack {
                Button(action: {
                
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Spacer()
                Image(systemName: "paperplane")
                    .foregroundColor(.white)
                
                Text("Bangalore, India")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            Text("Plan Your Best Event")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            
           
            Text("Explore the Best Events Around You.")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal)
            
         
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(["All", "Music", "Games", "Performing", "Hobbies"], id: \.self) { category in
                        Text(category)
                            .font(.subheadline)
                            .fontWeight(category == "All" ? .bold : .regular)
                            .foregroundColor(category == "All" ? .white : .white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                category == "All"
                                ? Color.white.opacity(0.1)
                                    : Color.clear
                            )
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
            }
            
            
            HStack {
               
                TextField("Find interesting events", text: .constant(""))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                Button(action: {
                 
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                }
            }
            .padding(.horizontal)
            
            
            HStack {
                Text("All Events")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                  
                }) {
                    Text("See All")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .padding(.top)
        
    }
}

struct HeadersView_Previews: PreviewProvider {
    static var previews: some View {
        HeadersView()
            .previewDevice("iPhone 14 Pro")
    }
}
