
import SwiftUI

struct OnboardingPageView: View {
    var page: OnboardingPage
    var body: some View {
        VStack {
            Image(page.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(page.title)
                .bold()
                .font(.largeTitle)
            Text(page.description)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
