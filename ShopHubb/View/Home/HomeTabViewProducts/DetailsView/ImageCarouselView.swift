
import SwiftUI

struct ImageCarouselView: View {
    @State private var currentindext = 0
    let imageWidth = UIScreen.main.bounds.width - 80
    let imageURLs: [URL]
    let timer = Timer.publish(every: 3.0, on: .main, in: .default).autoconnect()
    
    
    var body: some View {
        HStack {
            TabView(selection: $currentindext) {
                ForEach(0..<imageURLs.count, id: \.self) { index in
                    AsyncImage(url: imageURLs[index]) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth, height: 200)
                    } placeholder: {
                        Text(" ")
                    }
                    .tag(index)
                    .padding(.bottom, 40)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
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
        
        
        
    }
}
