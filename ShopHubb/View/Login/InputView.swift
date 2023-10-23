
import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        // Mark: Create common components to reuse
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .foregroundColor(Color(.darkGray))
            if isSecureField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 15))
            } else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 15))
            }
            Divider()
        }
    }
}
