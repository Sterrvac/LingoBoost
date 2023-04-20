import UIKit

protocol RegistrationViewDelegate {
}

final class RegistrationView: UIView {
    
    var delegate: RegistrationViewDelegate?
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        backgroundColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
