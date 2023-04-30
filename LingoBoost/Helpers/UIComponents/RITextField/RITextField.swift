import UIKit
import SnapKit

public enum StateTextField {
    case placeholderHeaden
    case placeholderShow
}

// MARK: - RITextField

public class RITextField: UITextField {
    
    private let insets: UIEdgeInsets
    
    private let personIconView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public init(insets: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)) {
        self.insets = insets
        super.init(frame: .zero)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds.inset(by: insets))
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds.inset(by: insets))
    }
    
    public func configurateTextField(name: String, image: UIImage?) {
        textColor = .gray
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = CGColor(gray: 0.5, alpha: 0.5)
        layer.cornerRadius = 25
        textAlignment = .natural
//        setLeadingPaddingPoints(width: 20)
        guard let image else { return }
        personIconView.image = image
        userName.text = name
    }
    
    public func stateRITextField(state: StateTextField) {
        switch state {
        case .placeholderHeaden:
            personIconView.isHidden = true
            userName.isHidden = true
        case .placeholderShow:
            personIconView.isHidden = false
            userName.isHidden = false
        }
    }
}

private extension RITextField {
    func configuratedView() {
        addSubViews(items: [personIconView, userName])
    }
    func configurationConstrantion() {
        personIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
        userName.snp.makeConstraints { make in
            make.centerY.equalTo(personIconView)
            make.leading.equalTo(personIconView.snp.trailing).offset(10)
        }
    }
}
