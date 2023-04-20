import UIKit

protocol AutorizationViewDelegate {
}

final class AutorizationView: UIView {
    
    var delegate: AutorizationViewDelegate?
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
