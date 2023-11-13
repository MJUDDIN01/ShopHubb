
import SwiftUI

struct HomeTabViewRow: View {
    var product: Products
    
    var body: some View {
        HStack {
            // Mark:- Thumbnail image as circle image
            AsyncImage(url: product.thumbNailUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.theme.accent)
            } placeholder: {
                Circle()
                    .frame(width: 48, height: 48)
                    .background(Color(.systemGray5))
            }
            // Mark:- Product info
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(product.brand.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            // Mark:- Product price info
            VStack {
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(product.price.toCurrency())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                    Text("\(product.discountPercentage.toPercentString())")
                        .font(.caption)
                        .padding(.leading, 6)
                        .foregroundColor(product.discountPercentage > 0 ? Color.theme.red : Color.theme.green)
                }
                .padding(.leading, 2)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

