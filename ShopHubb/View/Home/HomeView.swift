//
//  HomeView.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 19/10/2023.
//

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
            
            FavouriteView()
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
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}

struct HomeTabView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
    }
}

struct FavouriteView: View {
    var body: some View {
        Text("Favourite")
            .font(.largeTitle)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
            .font(.largeTitle)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .font(.largeTitle)
    }
}

