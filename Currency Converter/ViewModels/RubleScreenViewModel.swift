import UIKit

class RubleScreenViewModel: ScreenViewModelProtocol {
    
    var networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func convertMoney(_ rate: Double, _ money: Double, _ symbol: String) -> String {
        let resultConverting = round(money * 100 / rate * 100) / 100
        let result = "\(resultConverting) \(symbol)"
        return result
    }
}
