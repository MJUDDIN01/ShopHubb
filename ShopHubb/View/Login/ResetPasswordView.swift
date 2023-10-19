import SwiftUI

struct ResetPasswordView: View {
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        // Form field
        VStack(spacing: 15) {
            InputView(text: $newPassword,
                      title: "Password",
                      placeHolder: "Enter your password",
                      isSecureField: true)
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placeHolder: "Enter password again",
                      isSecureField: true)
        }
        .padding()
        Button {
            // Add logic for password reset
            dismiss()
        } label: {
            Text("Reset Password")
                .padding()
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width-30, height: 50)
                .background(Color.blue)
                .cornerRadius(25)
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}
