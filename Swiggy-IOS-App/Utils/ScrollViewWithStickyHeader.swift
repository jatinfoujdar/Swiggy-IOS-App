import SwiftUI

struct ScrollViewWithStickyHeader<Header: View, Content: View>: View {
    let header: () -> Header
    let content: () -> Content
    let headerHeight: CGFloat
    let stickyThreshold: CGFloat

    @State private var scrollOffset: CGPoint = .zero
    @State private var isSticky: Bool = false

    init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        headerHeight: CGFloat,
        stickyThreshold: CGFloat = 50
    ) {
        self.header = header
        self.content = content
        self.headerHeight = headerHeight
        self.stickyThreshold = stickyThreshold
    }

    var body: some View {
        ZStack(alignment: .top) {
            ScrollViewWithOffset(onScroll: handleScrollOffset) {
                VStack(spacing: 0) {
                    headerView
                    content()
                }
            }

            if isSticky {
                stickyHeaderView
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: isSticky)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    var headerView: some View {
        header()
            .frame(height: headerHeight)
            .scaleEffect(getHeaderScale())
            .animation(.easeOut, value: scrollOffset)
    }

    var stickyHeaderView: some View {
        header()
            .frame(height: headerHeight)
            .background(Color.white)
            .shadow(radius: 4)
    }

    private func handleScrollOffset(_ offset: CGPoint) {
        scrollOffset = offset
        isSticky = offset.y > headerHeight - stickyThreshold
    }

    private func getHeaderScale() -> CGFloat {
        let scaleFactor = 1 + (scrollOffset.y / 200)
        return max(1.0, min(scaleFactor, 1.5))
    }
}
