import UIKit

class DollarScreenViewModel: ScreenViewModelProtocol {

    var networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}


