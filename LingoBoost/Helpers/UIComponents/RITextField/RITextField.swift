import UIKit
import SnapKit

// MARK: - RITextField

public class RITextField: UITextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configurateTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configurateTextField() {
        textColor = .gray
        textAlignment = .center
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = CGColor(gray: 0.5, alpha: 0.5)
        layer.cornerRadius = 15
    }
}
