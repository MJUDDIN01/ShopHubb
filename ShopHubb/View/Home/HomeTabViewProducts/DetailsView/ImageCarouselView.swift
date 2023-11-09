import SwiftUI

struct ImageCarouselView: View {
    let product: Products
    @State private var currentindext = 0
    @State private var isFavorite = false
    @EnvironmentObject var coreDataFavoriteViewModel: CoreDataFavoriteViewModel
    let imageWidth = UIScreen.main.bounds.width - 10
    let imageURLs: [URL]
    let timer = Timer.publish(every: 3.0, on: .main, in: .default).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                TabView(selection: $currentindext) {
                    ForEach(0..<imageURLs.count, id: \.self) { index in
                        AsyncImage(url: imageURLs[index]) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: imageWidth, height: 180)
                        } placeholder: {
                            Text(" ")
                        }
                        .tag(index)
                    }
                }
                .padding(.leading, 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .animation(.easeInOut, value: currentindext)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentindext = (currentindext + 1) % imageURLs.count
                    }
                }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(1..<imageURLs.count, id: \.self) { index in
                            AsyncImage(url: imageURLs[index]) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                Text(" ")
                            }
                        }
                        .padding(.trailing, 5)
                    }
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    // Toggle favorite state
                    isFavorite.toggle()
                    // Update Core Data or your favorite data model here
                    if coreDataFavoriteViewModel.isProductInFavorites(product) {
                        coreDataFavoriteViewModel.removeProductFromFavorites(product)
                    } else {
                        coreDataFavoriteViewModel.addProducts(title: product.title, brand: product.brand)
                    }
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(5)
                }
                .font(.title)
            }
            .padding(10)
        }
        .background(Color.white)
        .border(Color(uiColor: .systemGray4))
    }
}
