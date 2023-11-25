import UIKit

final class MainScreenViewController: UIViewController {
    
    private var viewModel: RootViewModelProtocol
    
    var mainScrennView: MainScreenView { return self.view as! MainScreenView}

    init(viewModel: RootViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didFinishFetchingData = { (data) in
            print(data)
            
        }
    }
    
    override func loadView() {
        self.view = MainScreenView(frame: UIScreen.main.bounds)
    }
}

