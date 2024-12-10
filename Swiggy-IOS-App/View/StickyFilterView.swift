import SwiftUI

struct StickyFilterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(["Filter", "Newly Launched", "Top Rated", "Best Sellers"], id: \.self) { category in
                    HStack {
                        Image(systemName: iconName(for: category))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.orange)
                        
                        Text(category)
                            .font(.subheadline)
                            
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.orange, lineWidth: 1)
                        
                    )
                }
            }
            
            .padding(.horizontal)
           
            .padding()
        }
    }

 
    private func iconName(for category: String) -> String {
        switch category {
        case "Filter": return "line.3.horizontal.decrease.circle"
        case "Newly Launched": return "sparkles"
        case "Top Rated": return "star.fill"
        case "Best Sellers": return "crown.fill"
        default: return "questionmark.circle"
        }
    }
}

#Preview {
    StickyFilterView()
}
