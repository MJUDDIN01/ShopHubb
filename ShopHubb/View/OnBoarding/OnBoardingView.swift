import SwiftUI

struct OnBoardingView: View {
    let onBoardingPages: [OnboardingPage] = [
        OnboardingItem(imageName: "Explore_Products", title: "Explore Products", description: "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout"),
        OnboardingItem(imageName: "Easy_Payment", title: "Easy Payment", description: "Easy Payment of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout"),
        OnboardingItem(imageName: "Quick_Delivery", title: "Quick Delivery", description: "Quick Delivery of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout")
    ]
    @State private var currentPage = 0
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Text("Skip Login")
                            .padding()
                    }
                }
                TabView(selection: $currentPage) {
                    ForEach(0..<onBoardingPages.count, id:\.self) { page in
                        OnboardingPageView(page: onBoardingPages[page])
                            .tag(page)
                            .padding(.bottom, 25)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .animation(.easeInOut, value: currentPage)
                .onReceive(timer) { _ in
                    currentPage = (currentPage + 1) % onBoardingPages.count
                }
                
                NavigationLink {
                    UserLoginView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("SignIn")
                            .bold()
                    }
                }
                .padding()
            }
        }
    }
}

