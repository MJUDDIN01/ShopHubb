import SwiftUI
// Mark: @main attribute specify the starting of the app
@main
// Mark: App protocol is a fundamental component in SwiftUI to build an app
struct ShopHubbApp: App {
    @StateObject private var coreDataFavoriteViewModel = CoreDataFavoriteViewModel()
    // Mark: Body specifies the UI heirerchy and it return the scene here
    var body: some Scene {
        // Mark: WindowGroup contains the main/initial content of this app
        WindowGroup {
            // Mark: The initial view to be displayed on app launch
            OnBoardingView()
                .environmentObject(coreDataFavoriteViewModel)
        }
    }
}
