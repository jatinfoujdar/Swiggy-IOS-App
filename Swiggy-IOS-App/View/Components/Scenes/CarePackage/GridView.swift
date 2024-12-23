import SwiftUI

struct  GridView: View {
    var body: some View {
        
        HStack {
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 250, height: 100)
                    .overlay(
                        Text("Instamart")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                    .cornerRadius(10)
                
                
                NavigationLink(destination: ScenesUIView()) {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 250, height: 100)
                        .overlay(
                            Image("secnes")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 250, height: 100)
                                .clipped()
                        )
                        .cornerRadius(10)
                }
            }
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 200)
                .overlay(
                    Text("Dineout")
                        .foregroundColor(.white)
                        .font(.headline)
                )
                .cornerRadius(10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        
        .navigationBarHidden(true)
    }
}


#Preview {
    GridView()
}
