import UIKit

class MainScreenView: UIView {
    
    private(set) var currency: Currency!
    
    let moneyTextField = CustomTextField()
    let convertButton = UIButton()
    
    
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
        moneyTextField.placeholder = "Введите сумму"
        moneyTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        convertButton.setTitle("Обменять", for: .normal)
        convertButton.setTitleColor(.white, for: .normal)
        convertButton.setTitleColor(.black, for: .highlighted)
        convertButton.layer.backgroundColor = UIColor.lightGray.cgColor
        convertButton.layer.cornerRadius = 22
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.isHidden = true
        
        
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        
        self.addSubview(moneyTextField)
        self.addSubview(convertButton)
        
        NSLayoutConstraint.activate([
            moneyTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            moneyTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moneyTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            moneyTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            moneyTextField.heightAnchor.constraint(equalToConstant: 44),
            
            convertButton.topAnchor.constraint(equalTo: moneyTextField.bottomAnchor, constant: 200 ),
            convertButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            convertButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            convertButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            convertButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    @objc
    func convertButtonTapped() {
        
    }
    
    @objc
    func editingChanged() {
        if  moneyTextField.text!.isEmpty {
            convertButton.isHidden = true
        } else {
            convertButton.isHidden = false
        }
    }
}


