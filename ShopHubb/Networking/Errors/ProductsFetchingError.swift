
import Foundation

enum ProductsFetchingError: Error {
    case unableToParseData
    case urlSessionError
    case httpFailureResponseCode
    case noDataReceived
}
