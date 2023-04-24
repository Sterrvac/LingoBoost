import UIKit

public class RIButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configurateButton() {
        backgroundColor = .systemGray
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
    }
}
