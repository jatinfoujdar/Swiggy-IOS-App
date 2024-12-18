import SwiftUI


struct HeaderView: View {
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "location.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                    
                    VStack(alignment: .leading) {
                        Text("Office")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Block-D")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }                    
                    Spacer()
                    Image("hero-img2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                
                .padding(.horizontal)
                
            }
            
            HStack(spacing: 20) {
                Text("Search")
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.black)
                Image(systemName: "microphone")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .cornerRadius(10)
    }
    
       

}
#Preview {
    HeaderView()
}
