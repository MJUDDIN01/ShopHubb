
import SwiftUI

struct ProductDetails: View {
    let product: Products
    @State private var isDescriptionExpanded: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Mark:- Load image in full
                ImageCarouselView(imageURLs: product.imagesUrl)
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
                    HStack {
                        Text("Description")
                            .bold()
                        Image(systemName: isDescriptionExpanded ? "arrow.up.circle" : "arrow.down.circle")
                            .onTapGesture {
                                withAnimation {
                                    isDescriptionExpanded.toggle()
                                }
                            }
                    }
                    .foregroundColor(Color.blue)
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
        .padding()
    }
    private func discountedPrice() -> Double {
        return Double(product.price - Int(product.discountPercentage))
    }
}
