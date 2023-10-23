
import SwiftUI

struct UserLoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            // Mark: Form field
            VStack(spacing: 15) {
                // Mark: Use the InputView
                InputView(text: $email,
                          title: "Email",
                          placeHolder: "Enter your email")
                .autocapitalization(.none)
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
            }
            .padding()
            // Password reset
            NavigationLink {
                // Mark: Navigate to password reset page
                ResetPasswordView()
            } label: {
                HStack(spacing: 3) {
                    Text("Forgot password?")
                        .bold()
                        .padding(.leading, 180)
                }
            }
            
            // Mark: Sign In button
            NavigationLink {
                HomeView()
            } label: {
                Text("Sign In")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width-30, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
            // Mark: Navigate to SignUp
            NavigationLink {
                RegistrationView()
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have account?")
                    Text("Sign Up")
                        .bold()
                }
            }
            .padding()
        }
    }
}
