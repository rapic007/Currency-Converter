import UIKit

class MainScreenView: UIView {
    
    
    let moneyTextField = CustomTextField()
    let officialRateLabel = CustomLabel()
    var changeLabel = CustomLabel()
    
    var onEditingChanged: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        
        moneyTextField.isCanPaste = false
        moneyTextField.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 30)
        moneyTextField.placeholder = "Введите сумму в BYN"
        moneyTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        moneyTextField.keyboardType = .decimalPad
        
        self.addSubview(moneyTextField)
        self.addSubview(officialRateLabel)
        self.addSubview(changeLabel)
        
        NSLayoutConstraint.activate([
            moneyTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            moneyTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moneyTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            moneyTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            moneyTextField.heightAnchor.constraint(equalToConstant: 44),
            
            
            officialRateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            officialRateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            officialRateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            changeLabel.topAnchor.constraint(equalTo: officialRateLabel.bottomAnchor, constant: 50),
            changeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
    @objc
    func editingChanged() {
        onEditingChanged?()
    }
}


