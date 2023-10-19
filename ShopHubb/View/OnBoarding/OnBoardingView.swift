import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Text("Skip Sign In")
                            .bold()
                    }
                }
                GeometryReader { geometryReader in
                    Image("Explore_Products")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometryReader.size.width - 32)
                        .foregroundColor(.accentColor)
                }
                
                Group {
                    Text("Explore Products")
                        .bold()
                        .font(.largeTitle)
                    Text("The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout.")
                        .padding()
                }
                HStack {
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(.gray)
                        .border(.black)
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(.clear)
                        .border(.black)
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(.clear)
                        .border(.black)
                }
                .padding()
                Spacer()
                // Navigate to sign In page
                NavigationLink {
                    UserLoginView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .bold()
                    }
                }
            }
            .padding()
            
        }
    }
}
