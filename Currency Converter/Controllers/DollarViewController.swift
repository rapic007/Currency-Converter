import UIKit

final class DollarViewController: UIViewController {
    
    var rate = 0.0
    var dollarScreenViewModel: ScreenViewModelProtocol
    var dollarScreenView: ScreenView { return self.view as! ScreenView}
    
    init(dollarScreenViewModel: ScreenViewModelProtocol) {
        self.dollarScreenViewModel = dollarScreenViewModel
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
        dollarScreenView.onEditingChanged = { [weak self] in self?.editingChanged()}
        getData()
        }
    
    private func getData() {
        let urlString = URLs.USD.rawValue
        dollarScreenViewModel.getData(url: urlString){ result in
            switch result {
            case let .success(Currency):
                DispatchQueue.main.async {
                    self.dollarScreenView.officialRateLabel.text = "1 $ = \(Currency.curOfficialRate) BYN"
                    self.rate = Currency.curOfficialRate
                }
                
            case let .failure(NetworkError):
                print(NetworkError)
            }
            
        }
    }

    @objc
    func editingChanged() {
        dollarScreenView.changeLabel.textColor = .black
        if dollarScreenView.moneyTextField.text!.isEmpty {
            dollarScreenView.changeLabel.text = "0.0 $"
        } else {
            guard let moneyFromTextField = dollarScreenView.moneyTextField.text  else { return }
            guard let money = Double(moneyFromTextField) else {
                dollarScreenView.changeLabel.textColor = .red
                dollarScreenView.changeLabel.text = "Неверное значение"
                return
            }
            let symbol = "$"
            let resultConverting = self.dollarScreenViewModel.convertMoney(rate, money, symbol)
            self.dollarScreenView.changeLabel.text = "\(resultConverting)"
        }
    }
}

