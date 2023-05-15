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
    
    private let boxReload: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
//      UIImage(systemName: "arrow.triangle.2.circlepath")
        return button
    }()
    
    private let boxNext: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    private let boxBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        return button
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
        addSubViews(items: [boxTextField,
                            boxReload,
                            boxNext,
                            boxBack])
    }
    func configurationConstrantion() {
        boxTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(120)
        }
        boxReload.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
        }
        boxNext.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        boxBack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    @objc func textFieldEditing(boxTextField: UITextField) {
    }
}
