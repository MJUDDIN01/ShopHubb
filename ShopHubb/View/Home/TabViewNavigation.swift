//
//  TabViewNavigation.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import SwiftUI

struct TabViewNavigation: View {
    @State private var selectedTab = 0
    
    var body: some View {
            TabView(selection: $selectedTab) {
                // Home Tab
                NavigationView {
                    HomeTabView()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                        .tag(0)
                    
                    // Favorite Tab
                NavigationView {
                    FavoriteView()
                }
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favourite")
                    }
                    .tag(1)
                    
                    // Search Tab
                    NavigationView {
                        SearchView()
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(2)
                    
                    // Basket Tab
                NavigationView {
                        BasketView()
                    }
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Basket")
                    }
                    .tag(3)
                }
            .navigationBarBackButtonHidden(true)
            }
        }

