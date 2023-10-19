import SwiftUI

struct OnBoardingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
            }
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
