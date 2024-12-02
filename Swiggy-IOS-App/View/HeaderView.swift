import SwiftUI

struct HeaderView: View {
    @State private var message = "Press Spacebar"
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "location.fill")
                Text("Delhi,North")
                Spacer()
                Image(systemName: "person.fill")
            }
            VStack{
                HStack(spacing: 15){
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "microphone")
                }
                
            }
            .padding()
            .border(.black)
        }
    
    }
}

#Preview {
    HeaderView()
}
