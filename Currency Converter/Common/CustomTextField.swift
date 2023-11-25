

import UIKit

class CustomTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var isCanPaste = true
    
    init() {
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField() {
        textColor = .black
        backgroundColor = .lightGray
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.masksToBounds = true
        layer.cornerRadius = 22.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return isCanPaste
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    
    
}
