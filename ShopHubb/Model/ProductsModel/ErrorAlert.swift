//
//  ErrorAlert.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import Foundation

struct AlertData: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    var dismissButton: String
}

