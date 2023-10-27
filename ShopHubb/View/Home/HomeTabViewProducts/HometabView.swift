
import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0
    @State private var searchResult: [Products] = []
    @State private var noMatchingSearchItemFound: Bool = false
    @StateObject private var viewModel: HomeTabViewProductsViewModel
    init() {
        let networkingManager = NetworkingManager.shared
        self._viewModel = StateObject(wrappedValue: HomeTabViewProductsViewModel(productFetcher: networkingManager))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(searchResult.isEmpty ? viewModel.products : viewModel.filteredProducts, id: \.id) { product in
                    NavigationLink(destination: ProductDetails(product: product)) {
                        HomeTabViewRow(product: product)
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
        // Mark: Adding the searchBar outside the ZStak
        .searchable(text: $viewModel.searchText) {
            ForEach(viewModel.filteredProducts, id: \.id) { product in
                NavigationLink(destination: ProductDetails(product: product)) {
                    HomeTabViewRow(product: product)
                }
            }
        }
        
        }
   
}
