import SwiftUI

struct EventCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
         
            HStack {
                Image(systemName: "triangle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Team Clarion event")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("473 Followers")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    print("Follow tapped")
                }) {
                    Text("Follow")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .cornerRadius(20)
                }
            }
            
          
            Text("Prepare yourself to experience an epic concert and attend Justin Bieber's event tour which will give you an unforgettable music experience. Get your tickets now and join ...")
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Button(action: {
                print("Read more tapped")
            }) {
                Text("Read more")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        
    }
}



#Preview {
    EventCardView()
}
 
