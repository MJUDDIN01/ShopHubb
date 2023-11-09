
import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var coreDataFavoriteViewModel: CoreDataFavoriteViewModel

       var body: some View {
           List {
               ForEach(coreDataFavoriteViewModel.favoriteEntityProducts, id: \.self) { favoriteProduct in
                   Text("Title: \(favoriteProduct.title ?? ""), Brand: \(favoriteProduct.brand ?? "")")
               }
               .onDelete(perform: deleteProduct)
           }
           .onAppear {
               coreDataFavoriteViewModel.fetchProducts()
           }
           .navigationTitle("Favorite")
       }

       func deleteProduct(at offsets: IndexSet) {
           for index in offsets {
               let productToDelete = coreDataFavoriteViewModel.favoriteEntityProducts[index]
               coreDataFavoriteViewModel.context.viewContext.delete(productToDelete)
           }
           coreDataFavoriteViewModel.saveProducts()
       }
}
