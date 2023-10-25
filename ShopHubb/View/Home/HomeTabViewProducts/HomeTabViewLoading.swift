//
//  HomeTabViewLoading.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import SwiftUI

struct HomeTabViewLoading: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}
