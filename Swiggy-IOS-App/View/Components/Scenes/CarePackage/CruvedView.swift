import SwiftUI

struct CurvedView: View {
    struct CurvedShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width, y: rect.height - 50),
                control: CGPoint(x: rect.width / 2, y: rect.height + 50)
            )
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.closeSubpath()
            
            return path
        }
    }

    var body: some View {
        ZStack {
            CurvedShape()
                .fill(Color.orange)
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
                .overlay(
                    VStack {
                        SearchUIView()
                
                        RecommendationView()
                    }
            )
        }
        Spacer()
    }
}


#Preview {
    CurvedView()
}
