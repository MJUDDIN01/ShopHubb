
import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourite")
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(2)
            
            BasketView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Basket")
                }
                .tag(3)
        }
    }
}

