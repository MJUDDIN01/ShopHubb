//
//  HomeTabViewProductsViewModel.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import Foundation

class HomeTabViewProductsViewModel: ObservableObject {
    @Published var products: [Products] = []
    @Published var isLoading: Bool = false
    @Published var alertData: AlertData?
    @Published var searchText = ""
    
    private let productFetcher: ProductFetching
    
    // Mark:- Added constructor dependency
    init(productFetcher: ProductFetching) {
        self.productFetcher = productFetcher
    }
    // Mark:- Refresh products
    func pullToRefresh() {
        products.removeAll()
        refreshProduct()
    }
    func refreshProduct() {
        isLoading = true
        productFetcher.fetchProducts { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                switch result {
                case .success(let newPhone):
                    self?.products = newPhone
                case .failure(let error):
                    switch error {
                    case .unableToParseData:
                        self?.alertData = ServiceErrorAlert.unableToParseData
                    case .urlSessionError:
                        self?.alertData = ServiceErrorAlert.urlSessionError
                    case .httpFailureResponseCode:
                        self?.alertData = ServiceErrorAlert.httpFailureResponseCode
                    case .noDataReceived:
                        self?.alertData = ServiceErrorAlert.noDataReceived
                    }
                }
            }
        }
    }
}
