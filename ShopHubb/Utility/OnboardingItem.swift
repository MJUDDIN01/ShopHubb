//
//  OnboardingItem.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 23/10/2023.
//

import SwiftUI

protocol OnboardingPage {
    var imageName: String { get }
    var title: String { get }
    var description: String { get }
}

struct OnboardingItem: OnboardingPage {
    var imageName: String
    var title: String
    var description: String
}
