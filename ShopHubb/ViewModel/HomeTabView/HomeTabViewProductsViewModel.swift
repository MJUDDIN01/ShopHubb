
import Foundation
import Combine

class HomeTabViewProductsViewModel: ObservableObject {
    @Published var products: [Products] = []
    @Published var filteredProducts: [Products] = []
    @Published var isLoading: Bool = false
    @Published var alertData: AlertData?
    @Published var searchText = ""
    @Published var debouncedText = ""
    
    private var subscription = Set<AnyCancellable>()
    
    private let productFetcher: ProductFetching
    
    // Mark:- Added constructor dependency
    init(productFetcher: ProductFetching) {
        self.productFetcher = productFetcher
        // Mark: Combine property initialisation to broadcasts
        addSubscriber()
    }
    
    private func addSubscriber() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] searchText in
                self?.addFilteredProducts(searchText: searchText)
            })
            .store(in: &subscription)
    }
    private func addFilteredProducts(searchText: String) {
        // Mark: Trimmed the empty space while search
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !trimmedSearchText.isEmpty else {
            filteredProducts = []
            return
        }
        // Mark: Searchable with title, brand, category
        filteredProducts = products.filter({ product in
            let titleMatch = product.title.lowercased()
            let brandMatch = product.brand.lowercased()
            let categoryMatch = product.category.lowercased()
            return titleMatch.contains(trimmedSearchText) || brandMatch.contains(trimmedSearchText) || categoryMatch.contains(trimmedSearchText)
        })
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
