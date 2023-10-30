
import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0
    @State private var searchResult: [Products] = []
    @StateObject private var viewModel: HomeTabViewProductsViewModel
    init() {
        let networkingManager = NetworkingManager.shared
        self._viewModel = StateObject(wrappedValue: HomeTabViewProductsViewModel(productFetcher: networkingManager))
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView {
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
                    .padding(.top, 3)
                    .alert(item: $viewModel.alertData) { alertItem in
                        return Alert(title: Text(alertItem.title), message: Text(alertItem.message),
                                     dismissButton: .default(Text(alertItem.dismissButton)))
                    }
                }
                .padding(.top, -geometryReader.safeAreaInsets.top)
                // Mark: App Name and Profile icon
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("ShopHubb")
                                .font(.title)
                                Spacer()
                            // MArk: Add spacer to push the profile to the right
                            Spacer()
                            // Mark: Add the profile Icon
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .foregroundColor(.primary)
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
                .frame(minHeight: geometryReader.size.height)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}
