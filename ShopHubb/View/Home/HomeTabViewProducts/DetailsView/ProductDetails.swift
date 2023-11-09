
import SwiftUI

struct ProductDetails: View {
    let product: Products
    @State private var isDescriptionExpanded: Bool = false
    @State private var cartItemCount = 0
    @State private var isCartBlue = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    // Mark:- Load image in full
                    ImageCarouselView(product: product, imageURLs: product.imagesUrl)
                }
                Spacer()
                HStack {
                    StarRatingView(rating: product.rating)
                    Spacer()
                    Text("\(Int(discountedPrice()).toCurrency())")
                        .bold()
                        .foregroundColor(Color.red)
                    Text("\(product.price.toCurrency())")
                        .strikethrough()
                        .foregroundColor(Color.gray)
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Divider()
                        HStack {
                            Text("Description")
                                .bold()
                            Spacer()
                            Image(systemName: isDescriptionExpanded ? "chevron.up" : "chevron.down")
                                .foregroundColor(Color.gray)
                                .onTapGesture {
                                    withAnimation {
                                        isDescriptionExpanded.toggle()
                                    }
                                }
                        }
                        if isDescriptionExpanded {
                            HStack {
                                Text("Category:")
                                    .bold()
                                Text(product.category)
                            }
                            .padding(2)
                            Text(product.description)
                                .multilineTextAlignment(.leading)
                        }
                        Divider()
                    }
                }
                .padding(2)
                HStack {
                    Text("Hurry up Only")
                    Text("\(product.stock) \(product.title)")
                        .foregroundColor(Color.red)
                    Text("stocks left!!!")
                }
                Spacer()
                    .padding(2)
                    .navigationBarTitle(product.title, displayMode: .inline)
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()
                    // Mark: Add the profile Icon
                    NavigationLink(destination: BasketView(cartItemCount: $cartItemCount)) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .overlay(
                                Text("\(cartItemCount)")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.red)
                                    .offset(x: 8, y: -12) // Adjust the position as needed
                            )
                    }
                    
                }
                .foregroundColor(.primary)
            }
        }
        HStack {
            Button(action: {
                // Update cart item count
                cartItemCount += 1
                isCartBlue = true
            }) {
                Text("Add To Cart")
                    .font(.title)
                    .padding()
                    .background(isCartBlue ? Color.blue : Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func discountedPrice() -> Double {
        return Double(product.price - Int(product.discountPercentage))
    }
}
