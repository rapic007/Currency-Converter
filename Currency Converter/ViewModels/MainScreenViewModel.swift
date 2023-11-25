import UIKit

final class MainScreenViewModel {
    
    var didFinishFetchingData: ((String) -> Void)?
    
}

extension MainScreenViewModel: RootViewModelProtocol {
     
    func fetchData() {
        let data = "123"
        self.didFinishFetchingData?(data)
    }
    

}
