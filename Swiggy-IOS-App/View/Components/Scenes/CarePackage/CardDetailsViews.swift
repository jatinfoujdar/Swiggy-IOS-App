import SwiftUI

struct CardDetailsViews: View {
    let label: String
    let image: Image
    let roundButtonDiameter: CGFloat = 44
    let roundedCornerRadius: CGFloat = 10
    let gapToCornerItems: CGFloat = 4

    var body: some View {
        ZStack { // Use ZStack to layer elements on top of each other
            // Add a background rectangle
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]),
                                     startPoint: .top, endPoint: .bottom))
                .cornerRadius(roundedCornerRadius)  // Rounded corners for the background
                .frame(width: 380, height: 580)  // Size of the background rectangle

            VStack{
                VStack {
                    Text("Drake OVO Tour")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("World tour events")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        Text("19 : 00")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Wed, Jul 12")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                VStack{
                    Canvas { ctx, size in
                        if let label = ctx.resolveSymbol(id: "label") {
                            // Draw the label in the top-left corner
                            ctx.draw(label, in: CGRect(origin: .zero, size: label.size))
                            
                            // Build a path with rounded corners
                            let path = pathWithRoundedCorners(canvasSize: size, labelSize: label.size)
                            
                            // Use the path as clip shape for subsequent drawing operations
                            ctx.clip(to: path)
                        }
                        // Determine the rectangle for the image when scaled to fill
                        let resolvedImage = ctx.resolve(image)
                        let rect = rectForImage(canvasSize: size, imageSize: resolvedImage.size)
                        
                        // Show the image
                        ctx.draw(resolvedImage, in: rect)
                        
                    } symbols: {
                        labelInCorner.tag("label")
                    }
                    .overlay(alignment: .bottomTrailing) {
                        roundButton
                    }
                }
                EventCardView()
            }
            
            .frame(width: 360, height: 560)
        }
    }

    private func pathWithRoundedCorners(canvasSize: CGSize, labelSize: CGSize) -> Path {
        let wLabel = labelSize.width + gapToCornerItems
        let hLabel = labelSize.height + gapToCornerItems
        let wButton = roundButtonDiameter + gapToCornerItems
        let hButton = roundButtonDiameter + gapToCornerItems
        return Path { path in
            // Begin half-way down the left side
            path.move(to: CGPoint(x: 0, y: canvasSize.height / 2))

            // Rounded-corner bottom-left of label
            path.addArc(
                tangent1End: CGPoint(x: 0, y: hLabel),
                tangent2End: CGPoint(x: wLabel, y: hLabel),
                radius: roundedCornerRadius
            )
            // Rounded-corner bottom-right of label
            path.addArc(
                tangent1End: CGPoint(x: wLabel, y: hLabel),
                tangent2End: CGPoint(x: wLabel, y: 0),
                radius: (hLabel + gapToCornerItems) / 2
            )
            // Rounded-corner top-right of label
            path.addArc(
                tangent1End: CGPoint(x: wLabel, y: 0),
                tangent2End: CGPoint(x: canvasSize.width, y: 0),
                radius: roundedCornerRadius
            )
            // Rounded-corner top-right
            path.addArc(
                tangent1End: CGPoint(x: canvasSize.width, y: 0),
                tangent2End: CGPoint(x: canvasSize.width, y: canvasSize.height - hButton),
                radius: roundedCornerRadius
            )
            // Rounded-corner top-right of round button
            path.addArc(
                tangent1End: CGPoint(x: canvasSize.width, y: canvasSize.height - hButton),
                tangent2End: CGPoint(x: canvasSize.width - wButton, y: canvasSize.height - hButton),
                radius: roundedCornerRadius
            )
            // Rounded-corner top-left of round button
            path.addArc(
                tangent1End: CGPoint(x: canvasSize.width - wButton, y: canvasSize.height - hButton),
                tangent2End: CGPoint(x: canvasSize.width - wButton, y: canvasSize.height),
                radius: (wButton + gapToCornerItems) / 2
            )
            // Rounded-corner bottom-left of round button
            path.addArc(
                tangent1End: CGPoint(x: canvasSize.width - wButton, y: canvasSize.height),
                tangent2End: CGPoint(x: 0, y: canvasSize.height),
                radius: roundedCornerRadius
            )
            // Rounded-corner bottom-left
            path.addArc(
                tangent1End: CGPoint(x: 0, y: canvasSize.height),
                tangent2End: CGPoint(x: 0, y: canvasSize.height / 2),
                radius: roundedCornerRadius
            )
            path.closeSubpath()
        }
    }

    private func rectForImage(canvasSize: CGSize, imageSize: CGSize) -> CGRect {
        let wImage = imageSize.width
        let hImage = imageSize.height
        let scalingFactor = max(canvasSize.width / wImage, canvasSize.height / hImage)
        let w = wImage * scalingFactor
        let h = hImage * scalingFactor
        let xImage = (canvasSize.width - w) / 2
        let yImage = (canvasSize.height - h) / 2
        return CGRect(
            origin: CGPoint(x: xImage, y: yImage),
            size: CGSize(width: w, height: h)
        )
    }

    private var labelInCorner: some View {
        Text(label)
            .font(.subheadline)
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            .background {
                Capsule()
                    .fill(Color(.systemGray5))
            }
    }

    private var roundButton: some View {
        Image(systemName: "heart")
            .resizable()
            .scaledToFit()
            .padding(12)
            .frame(width: roundButtonDiameter, height: roundButtonDiameter)
            .background {
                Circle()
                    .fill(Color(.systemGray5))
            }
            .onTapGesture {
                print("+like")
            }
    }
}

#Preview {
    CardDetailsViews(label: "Music", image: Image("images"))
}


