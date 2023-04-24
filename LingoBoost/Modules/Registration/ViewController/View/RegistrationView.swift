import UIKit
import SnapKit

protocol RegistrationViewDelegate {
}

final class RegistrationView: UIView {
    
    var delegate: RegistrationViewDelegate?
    
    var appearance = Appearance()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let nameTextField: RITextField = {
        let textField = RITextField()
        textField.placeholder = "Name"
        textField.configurateTextField()
        return textField
    }()
    
    private let emailTextField: RITextField = {
        let textField = RITextField()
        textField.placeholder = "Email"
        textField.configurateTextField()
        return textField
    }()
    
    private let passwordTextField: RITextField = {
        let textField = RITextField()
        textField.placeholder = "Password"
        textField.configurateTextField()
        return textField
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите язык:"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let selectionLanguage: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Английский"
        return button
    }()
    // MARK: - Доделать кнопку наложения
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.down")
        return view
    }()
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegistrationView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [titleLabel,
                           nameTextField,
                           emailTextField,
                           passwordTextField,
                           subTitleLabel])
    }
    func configurationConstrantion() {
        titleLabel.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeTitle)
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeButton)
            make.center.equalToSuperview()
            make.leading.equalTo(25)
        }
        emailTextField.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeButton)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(25)
            make.leading.equalTo(nameTextField)
        }
        passwordTextField.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeButton)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.leading.equalTo(emailTextField)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.leading.equalTo(passwordTextField)
        }
    }
}
        
