
import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0
    @StateObject private var viewModel: HomeTabViewProductsViewModel
    @State private var searchResult: [Products] = []
    @State private var noMatchingSearchItemFound: Bool = false
    init() {
        let networkingManager = NetworkingManager.shared
        self._viewModel = StateObject(wrappedValue: HomeTabViewProductsViewModel(productFetcher: networkingManager))
    }
    
    var body: some View {
        ZStack {
            List(searchResult.isEmpty ? viewModel.products : searchResult, id: \.id) { product in
                NavigationLink(destination: ProductDetails(product: product)) {
                    HomeTabViewRow(product: product)
                }
            }
            .searchable(text: $viewModel.searchText) {
                ForEach(viewModel.products, id: \.id) { product in
                    Text("You might want \(product.brand)")
                        .searchCompletion(product.brand)
                }
            }
            .onChange(of: viewModel.searchText) { searchText in
                if searchText.isEmpty {
                    // Clear the search results if the search text is empty
                    searchResult = []
                    noMatchingSearchItemFound = false
                    viewModel.refreshProduct()
                } else {
                    searchResult = viewModel.products.filter {
                        $0.brand.localizedCaseInsensitiveContains(searchText)
                    }
                    noMatchingSearchItemFound = searchResult.isEmpty
                    
                    // GET products from viewModel.products that appear in searchResult
                    let productIdsInSearch = Set(searchResult.map { $0.id })
                    viewModel.products = viewModel.products.filter { productIdsInSearch.contains($0.id) }
                }
            }
            .onAppear { viewModel.refreshProduct() }
            .refreshable {
                viewModel.pullToRefresh()
            }
            if viewModel.isLoading { HomeTabViewLoading() }
        }
        .alert(item: $viewModel.alertData) { alertItem in
            return Alert(title: Text(alertItem.title), message: Text(alertItem.message),
                         dismissButton: .default(Text(alertItem.dismissButton)))
        }
    }
}
