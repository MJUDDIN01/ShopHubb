
import Foundation

// Mark:- Add currency for Price
extension Int {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0"
    }
}

