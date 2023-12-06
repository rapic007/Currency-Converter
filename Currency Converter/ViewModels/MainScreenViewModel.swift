import UIKit

class MainScreenViewModel: MainScreenViewModelProtocol {

    var networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    let urlString = "https://api.nbrb.by/exrates/rates/431"
    func getData(completion: @escaping (Result<Currency, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        networkManager.call(with: request, attempt: 2)  { result in
            completion(result)
        }
    }

    func convertMoney(_ rate: Double, _ money: Double ) -> String {
        let resultConverting = round(money / rate * 100) / 100
        let result = "\(resultConverting) $"
        return result
    }
}


