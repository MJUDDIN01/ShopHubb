
import Foundation
import CoreData

class CoreDataFavoriteViewModel: ObservableObject {
    var context: NSPersistentContainer
    @Published var favoriteEntityProducts: [FavoriteEntityProducts] = []
    
    init(inMemory: Bool = false) {
        context = NSPersistentContainer(name: "FavoriteCoreDataModel")
        if inMemory {
            context.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        context.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func fetchProducts() {
        let request = NSFetchRequest<FavoriteEntityProducts>(entityName: "FavoriteEntityProducts")
        do {
            favoriteEntityProducts = try context.viewContext.fetch(request)
        } catch (let error) {
            print("Unable to fetch \(error)")
        }
    }
    
    func saveProducts() {
        do {
            try context.viewContext.save()
            print("Data has been saved successfully.")
        } catch let error {
            print("Error saving in core data \(error)")
        }
    }
    
    func isProductInFavorites(_ product: Products) -> Bool {
        return favoriteEntityProducts.contains { $0.title == product.title && $0.brand == product.brand }
    }
    
    func addProducts(title: String, brand: String) {
        let favoriteEntity = FavoriteEntityProducts(context: context.viewContext)
        favoriteEntity.title = title
        favoriteEntity.brand = brand
        self.saveProducts()
    }
    
    func removeProductFromFavorites(_ product: Products) {
        if let index = favoriteEntityProducts.firstIndex(where: { $0.title == product.title && $0.brand == product.brand }) {
            context.viewContext.delete(favoriteEntityProducts[index])
            self.saveProducts()
        }
    }
}
