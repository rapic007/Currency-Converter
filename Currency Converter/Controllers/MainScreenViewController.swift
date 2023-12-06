import UIKit

final class MainScreenViewController: UIViewController {
    
    var rate = 0.0
    var mainScreenViewModel: MainScreenViewModelProtocol
    var mainScrennView: MainScreenView { return self.view as! MainScreenView}
    
    init(mainScreenViewModel: MainScreenViewModelProtocol) {
        self.mainScreenViewModel = mainScreenViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MainScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrennView.onEditingChanged = { [weak self] in self?.editingChanged()}
        getData()
        }
    
    private func getData() {
        mainScreenViewModel.getData{ result in
            switch result {
            case let .success(Currency):
                DispatchQueue.main.async {
                    self.mainScrennView.officialRateLabel.text = "1 BYN = \(Currency.curOfficialRate) $"
                    self.rate = Currency.curOfficialRate
                }
                
            case let .failure(NetworkError):
                print(NetworkError)
            }
            
        }
    }

    @objc
    func editingChanged() {
        mainScrennView.changeLabel.textColor = .black
        if mainScrennView.moneyTextField.text!.isEmpty {
            mainScrennView.changeLabel.text = "0.0 $"
        } else {
            guard let moneyFromTextField = mainScrennView.moneyTextField.text  else { return }
            guard let money = Double(moneyFromTextField) else {
                mainScrennView.changeLabel.textColor = .red
                mainScrennView.changeLabel.text = "Неверное значение"
                return
            }
            let resultConverting = self.mainScreenViewModel.convertMoney(rate, money)
            self.mainScrennView.changeLabel.text = "\(resultConverting)"
        }
    }
}

