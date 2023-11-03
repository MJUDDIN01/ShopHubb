
import SwiftUI

struct ProductsListView: View {
    @Binding var searchResult: [Products]
    @ObservedObject var viewModel: HomeTabViewProductsViewModel
    
    var body: some View {
        List(searchResult.isEmpty ? viewModel.products : viewModel.filteredProducts, id: \.id) { product in
            NavigationLink(destination: ProductDetails(product: product)) {
                HomeTabViewRow(product: product)
            }
        }
        .onAppear { viewModel.refreshProduct() }
        .refreshable {
            viewModel.pullToRefresh()
        }
        if viewModel.isLoading {
            HomeTabViewLoading()
        }
    }
}
