import UIKit

struct AppDependency{
    lazy var networkManager: NetworkManagerProtocol = {
        return NetworkManager()
    }()
    
    lazy var mainScreenViewModel: MainScreenViewModelProtocol = {
        return MainScreenViewModel(networkManager: self.networkManager)
    }()
}
