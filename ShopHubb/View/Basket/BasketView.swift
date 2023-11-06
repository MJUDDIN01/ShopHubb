
import SwiftUI

struct BasketView: View {
    @Binding var cartItemCount: Int
    var body: some View {
        if cartItemCount != 0 {
            Text("Items in cart \(cartItemCount)")
                .font(.headline)
        } else {
            Text("Nothing in Cart")
                .font(.largeTitle)
        }
        
        
    }
}
