import SwiftUI

struct StickyHeaderView: View {
    @State private var scrollOffset: CGFloat = 0
    let headerHeight: CGFloat = 100
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Sticky Header
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY
                    Color.blue
                        .frame(height: headerHeight)
                        .overlay(
                            Text("Sticky Header")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        )
                        
                        .offset(y: offset > 0 ? 0 : -offset) // Sticky effect
                        .zIndex(1) // Ensure it's on top
                }
                .frame(height: headerHeight)
                
                // Scrollable Content
                ForEach(0..<50, id: \.self) { index in
                    Text("Item \(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(index % 2 == 0 ? Color.gray.opacity(0.5) : Color.clear)
                        .border(Color.gray, width: 1)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct StickyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeaderView()
    }
}
