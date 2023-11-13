
import SwiftUI

struct HomeTabViewLoading: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.gray))
                .scaleEffect(2)
        }
    }
}
