
import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var coreDataFavoriteViewModel: CoreDataFavoriteViewModel
    
    var body: some View {
        List {
            ForEach(coreDataFavoriteViewModel.favoriteEntityProducts, id: \.self) { favoriteProduct in
                HStack {
                    AsyncImage(url: URL(string: favoriteProduct.thumbnail ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.orange)
                    } placeholder: {
                        Circle()
                            .frame(width: 48, height: 48)
                            .background(Color(.systemGray5))
                    }
                    Text(" \(favoriteProduct.title ?? "")")
                    Text(" \(favoriteProduct.brand ?? "")")
                }
            }
            .onDelete(perform: deleteProduct)
        }
        .onAppear {
            coreDataFavoriteViewModel.fetchProducts()
            coreDataFavoriteViewModel.removeDuplicates()
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
