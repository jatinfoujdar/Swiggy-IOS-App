import SwiftUI


struct ScrollViewWithOffset<Content: View>: View {
    let onScroll: (CGPoint) -> Void
    let content: () -> Content

    init(onScroll: @escaping (CGPoint) -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.onScroll = onScroll
        self.content = content
    }

    var body: some View {
        ScrollView {
            GeometryReader { geo in
                Color.clear
                    .preference(key: ScrollOffsetKey.self, value: geo.frame(in: .global).origin)
            }
            .frame(height: 0) // Used only for offset tracking

            VStack {
                content()
            }
        }
        .onPreferenceChange(ScrollOffsetKey.self, perform: onScroll)
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}
