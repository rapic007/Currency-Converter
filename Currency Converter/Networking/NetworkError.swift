import UIKit

enum NetworkError: Error {
    case timedOut(String = "Timed out")
    case connectionFailure(String = "Connection failure")
    case noData(String = "No data")
    case invalidURL(String = "Invalid URL")
    case unknown(String = "An unknown error occurred.")
}
