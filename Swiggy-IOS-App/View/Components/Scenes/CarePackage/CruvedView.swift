
import SwiftUI

struct CruvedView: View {
    struct CurvedShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 0))
            
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width, y: rect.height - 0),
                control: CGPoint(x: rect.width / 2, y: rect.height + 50)
            )
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.closeSubpath()
            
            return path
        }
    }

    var body: some View {
        CurvedShape()
            .fill(Color.brown)
            .ignoresSafeArea(edges: .top)
            .frame(height: 180)
            .overlay(
                SearchUIView()
                    .padding(.bottom, 90)
            )
    }
}

#Preview {
    CruvedView()
}
