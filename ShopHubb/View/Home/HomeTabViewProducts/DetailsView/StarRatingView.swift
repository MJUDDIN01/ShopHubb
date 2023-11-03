
import SwiftUI

struct StarRatingView: View {
    let rating: Double
    let maxRating: Double = 5
    let starSpacing: CGFloat = 2.0
    var body: some View {
        HStack(spacing: starSpacing) {
            ForEach(0..<Int(maxRating), id: \.self) { star in
                let starValue = min(max(0, rating - Double(star)), 1.0)
                if starValue >= 0.75 {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else if starValue >= 0.5 {
                    Image(systemName: "star.leadinghalf.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                }
            }
        }
    }
}
