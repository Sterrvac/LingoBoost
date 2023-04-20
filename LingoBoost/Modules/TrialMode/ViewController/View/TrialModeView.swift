import UIKit

protocol TrialModeViewDelegate {}

final class TrialModeView: UIView {
    
    var delegate: TrialModeViewDelegate?
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
