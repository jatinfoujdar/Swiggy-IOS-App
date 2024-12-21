import SwiftUI

struct ScenesCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
          
            ZStack(alignment: .topLeading) {
                Image("images")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(16)
                    .clipped()
                
                Text("Music")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .padding([.leading, .top], 8)
               
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .background(Color.red.opacity(0.8))
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
         
            VStack(alignment: .leading, spacing: 4) {
                Text("Justin Bieber Tour")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("World tour events")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Text("19 : 00")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Wed, Jul 12")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding([.leading, .bottom, .trailing], 12)
        }
        .background(Color(red: 255/255, green: 153/255, blue: 51/255)) 
        .cornerRadius(16)
        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
        .padding()
    }
}

#Preview {
    ScenesCardView()
}
