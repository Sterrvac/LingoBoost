import UIKit
import SnapKit

class WordInBoxView: UIView {
    
    private let appearance = Appearance()
    
    private let boxTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите слово"
        textField.textColor = .systemGray
        textField.addTarget(nil, action: #selector(textFieldEditing), for: .editingChanged)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WordInBoxView {
    func configuratedView() {
        addSubViews(items: [boxTextField])
    }
    func configurationConstrantion() {
        boxTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(120)
        }
    }
    @objc func textFieldEditing(boxTextField: UITextField) {
    }
}
