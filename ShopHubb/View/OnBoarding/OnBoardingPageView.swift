
import SwiftUI

struct OnboardingPage: View {
    var imageName: String
    var title: String
    var description: String
    var rectangleColor: Color = .clear
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text("Skip SignIn")
                            .bold()
                            .padding()
                    }
                }
                GeometryReader { geometryReader in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometryReader.size.width - 32)
                        .foregroundColor(.accentColor)
                }
                Group {
                    Text(title)
                        .bold()
                        .font(.largeTitle)
                    Text(description)
                }
                .padding()
                HStack {
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(rectangleColor)
                        .border(.black)
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(rectangleColor)
                        .border(.black)
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .foregroundColor(rectangleColor)
                        .border(.black)
                }
                .padding()
                Spacer()
                // Mark: Navigate To Sign In Page
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
        .navigationTitle("ShopHubb")
    }
}
