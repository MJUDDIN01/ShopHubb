
import SwiftUI

struct ProductsSearchView: View {
    @Binding var searchResult: [Products]
    @ObservedObject var viewModel: HomeTabViewProductsViewModel
    
    var body: some View {
        List(searchResult.isEmpty ? viewModel.products : viewModel.filteredProducts, id: \.id) { product in
            NavigationLink(destination: ProductDetails(product: product)) {
                Text("You might want \(product.brand)")
                    .searchCompletion(product.brand)
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
