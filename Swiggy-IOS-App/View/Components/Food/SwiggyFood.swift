import SwiftUI

struct DottedLine: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 1) // Adjust height for thickness
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5, 5])) // Adjust dash pattern
                    .foregroundColor(.gray) // Set the color
            )
    }
}

#Preview {
    DottedLine()
}
