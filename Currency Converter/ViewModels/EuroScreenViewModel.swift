import UIKit

class EuroScreenViewModel: ScreenViewModelProtocol {
    
    var networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}
