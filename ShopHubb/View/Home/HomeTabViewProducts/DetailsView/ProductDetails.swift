
import SwiftUI

struct ProductDetails: View {
    let product: Products
    var body: some View {
        HStack {
            HStack {
                // Mark:- Load image in full
                AsyncImage(url: product.thumbNailUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width-30, height: 140)
                        .foregroundColor(Color.orange)
                    HStack {
                        Text("Price:").bold()
                        Text("\(Int(discountedPrice()).toCurrency())")
                            .bold()
                            .foregroundColor(Color.red)
                        Text("\(product.price.toCurrency())")
                            .strikethrough()
                            .foregroundColor(Color.gray)
                      
                    }
                } placeholder: {
                    Text("Thumbnail")
                        .frame(width: 32, height: 32)
                        .background(Color(.systemGray5))
                }
            }
            .padding()
        }
        VStack(alignment: .leading) {
            HStack {
                Text("Category:")
                    .bold()
                Text(product.category)
            }
            .padding(2)
            VStack(alignment: .leading) {
                Text("Description: ")
                    .bold()
                Text(product.description)
            }
            .padding(2)
            HStack {
                Text("Stock:").bold()
                Text("\(product.stock)")
            }
            HStack {
                Text("Rating:")
                    .bold()
                StarRatingView(rating: product.rating)
            }
            .padding(2)
            Spacer()
                .navigationBarTitle(product.title, displayMode: .inline)
        }
        .padding()
    }
    private func discountedPrice() -> Double {
        return Double(product.price - Int(product.discountPercentage))
        }
}
