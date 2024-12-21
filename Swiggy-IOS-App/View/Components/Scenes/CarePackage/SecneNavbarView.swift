import SwiftUI

struct SceneNavbarView: View {
    @State private var selectedTab: Tab = .home

    enum Tab: String {
        case home = "house.fill"
        case favorites = "heart"
        case calendar = "calendar"
        case settings = "gearshape"
    }

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()

                Button(action: {
                    selectedTab = tab
                }) {
                    Image(systemName: tab.rawValue)
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == tab ? .black : .gray)
                }

                Spacer()
            }
        }
        .frame(height: 60)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

extension SceneNavbarView.Tab: CaseIterable {}

struct SceneNavbarView_Previews: PreviewProvider {
    static var previews: some View {
        SceneNavbarView()
    }
}
