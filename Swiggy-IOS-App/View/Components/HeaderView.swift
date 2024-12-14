import SwiftUI


struct HeaderView: View {
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "location.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                    VStack{
                        Text("Office⌄")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Block-D")
                    }
                    
                    Spacer()
                    Image("hero-img2")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
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
