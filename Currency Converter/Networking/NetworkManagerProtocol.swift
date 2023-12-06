import UIKit

protocol NetworkManagerProtocol {
    func call(with request: URLRequest, attempt: Int, completion: @escaping(Result<Currency, NetworkError >) -> Void)
    func setTimeout(_ seconds: Double, completion: @escaping () -> Void)
}
