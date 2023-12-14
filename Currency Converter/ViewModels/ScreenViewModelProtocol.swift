import UIKit

protocol ScreenViewModelProtocol {
    func getData(url: String, completion: @escaping (Result<Currency, NetworkError>) -> Void)
    func convertMoney(_ rate: Double, _ money: Double, _ symbol: String ) -> String
}

extension ScreenViewModelProtocol {
    

    func getData(url: String, completion: @escaping (Result<Currency, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let networkManager = NetworkManager()
        networkManager.call(with: request, attempt: 2)  { result in
            completion(result)
        }

    }
    
    func convertMoney(_ rate: Double, _ money: Double,_ symbol: String) -> String {
        let resultConverting = round(money / rate * 100) / 100
        let result = "\(resultConverting) \(symbol)"
        return result
    }
}
