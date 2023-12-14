import UIKit

class EuroViewController: UIViewController {

    var rate = 0.0
    var euroScreenViewModel: ScreenViewModelProtocol
    var euroScreenView: ScreenView { return self.view as! ScreenView}
    
    init(euroScreenViewModel: ScreenViewModelProtocol) {
        self.euroScreenViewModel = euroScreenViewModel
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
        euroScreenView.onEditingChanged = { [weak self] in self?.editingChanged()}
        getData()
        }
    
    private func getData() {
        let urlString = URLs.EUR.rawValue
        euroScreenViewModel.getData(url: urlString){ result in
            switch result {
            case let .success(Currency):
                DispatchQueue.main.async {
                    self.euroScreenView.officialRateLabel.text = "1 € = \(Currency.curOfficialRate) BYN"
                    self.rate = Currency.curOfficialRate
                }
                
            case let .failure(NetworkError):
                print(NetworkError)
            }
            
        }
    }

    @objc
    func editingChanged() {
        euroScreenView.changeLabel.textColor = .black
        if euroScreenView.moneyTextField.text!.isEmpty {
            euroScreenView.changeLabel.text = "0.0 €"
        } else {
            guard let moneyFromTextField = euroScreenView.moneyTextField.text  else { return }
            guard let money = Double(moneyFromTextField) else {
                euroScreenView.changeLabel.textColor = .red
                euroScreenView.changeLabel.text = "Неверное значение"
                return
            }
            let symbol = "€"
            let resultConverting = self.euroScreenViewModel.convertMoney(rate, money, symbol)
            self.euroScreenView.changeLabel.text = "\(resultConverting)"
        }
    }
    
}
