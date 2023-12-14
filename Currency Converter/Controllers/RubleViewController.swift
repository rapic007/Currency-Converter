import UIKit

class RubleViewController: UIViewController {
    
    var rate = 0.0
    var rubleScreenViewModel: ScreenViewModelProtocol
    var rubleScreenView: ScreenView { return self.view as! ScreenView}
    
    init(rubleScreenViewModel: ScreenViewModelProtocol) {
        self.rubleScreenViewModel = rubleScreenViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rubleScreenView.onEditingChanged = { [weak self] in self?.editingChanged()}
        getData()
        }
    
    private func getData() {
        let urlString = URLs.RUB.rawValue
        rubleScreenViewModel.getData(url: urlString){ result in
            switch result {
            case let .success(Currency):
                DispatchQueue.main.async {
                    self.rubleScreenView.officialRateLabel.text = "100 ₽ = \(Currency.curOfficialRate) BYN"
                    self.rate = Currency.curOfficialRate
                }
                
            case let .failure(NetworkError):
                print(NetworkError)
            }
            
        }
    }

    @objc
    func editingChanged() {
        rubleScreenView.changeLabel.textColor = .black
        if rubleScreenView.moneyTextField.text!.isEmpty {
            rubleScreenView.changeLabel.text = "0.0 ₽"
        } else {
            guard let moneyFromTextField = rubleScreenView.moneyTextField.text  else { return }
            guard let money = Double(moneyFromTextField) else {
                rubleScreenView.changeLabel.textColor = .red
                rubleScreenView.changeLabel.text = "Неверное значение"
                return
            }
            let symbol = "₽"
            let resultConverting = self.rubleScreenViewModel.convertMoney(rate, money, symbol)
            self.rubleScreenView.changeLabel.text = "\(resultConverting)"
        }
    }
 
}
