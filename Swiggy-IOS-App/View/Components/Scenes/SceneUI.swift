//
//  SceneUI.swift
//  Swiggy-IOS-App
//
//  Created by jatin foujdar on 17/12/24.
//

import SwiftUI

struct SceneUI: View {
    struct RoundedCorners: Shape {
        var radius: CGFloat = 25.0
        var corners: UIRectCorner = .allCorners
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
    var body: some View {
        Image("images")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(RoundedCorners(radius: 50, corners: [.topLeft, .bottomRight]))
            .shadow(radius: 5)
            .padding()
    }
}
      


#Preview {
    SceneUI()
}
