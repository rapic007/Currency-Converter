import UIKit

struct AppDependency{
    lazy var networkManager: NetworkManagerProtocol = {
        return NetworkManager()
    }()
    
    lazy var dollarScreenViewModel: ScreenViewModelProtocol = {
        return DollarScreenViewModel(networkManager: self.networkManager)
    }()
    
    lazy var euroScreenViewModel: ScreenViewModelProtocol = {
        return EuroScreenViewModel(networkManager: self.networkManager)
    }()
    
    lazy var rubleScreenViewModel: ScreenViewModelProtocol = {
        return RubleScreenViewModel(networkManager: self.networkManager)
    }()
}
