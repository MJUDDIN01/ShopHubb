//
//  ProductsFetchingError.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import Foundation

enum ProductsFetchingError: Error {
    case unableToParseData
    case urlSessionError
    case httpFailureResponseCode
    case noDataReceived
}
