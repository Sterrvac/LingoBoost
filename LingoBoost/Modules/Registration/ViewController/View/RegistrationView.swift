import UIKit
import SnapKit

protocol RegistrationViewDelegate {
    func registration()
}

final class RegistrationView: UIView {
    
    var delegate: RegistrationViewDelegate?
    
    var appearance = Appearance()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let nameTextField: RITextField = {
        let textField = RITextField()
        textField.placeholder = "Имя"
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
        textField.placeholder = "Пароль"
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
    
    private let customSwitchButton: CustomSwitchButton = {
        let customSwitchButton = CustomSwitchButton()
        return customSwitchButton
    }()
    
    private lazy var registrationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle("Регистрация", for: .normal)
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        return button
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
                            subTitleLabel,
                            customSwitchButton,
                            registrationButton])
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
        customSwitchButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(34)
            make.trailing.equalTo(passwordTextField)
            make.size.equalTo(appearance.sizeButtonSwitch)
        }
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(subTitleLabel)
            make.centerX.equalToSuperview()
            make.size.equalTo(appearance.sizeButton)
        }
    }
    
    @objc func registration() {
        delegate?.registration()
    }
}
        
