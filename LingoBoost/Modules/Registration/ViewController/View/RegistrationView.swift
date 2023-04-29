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
        label.text = Resourses.Strings.MainHeaders.registration
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let nameTextField: RINameTextField = {
        let textField = RINameTextField()
//        textField.textAlignment = .left
//        textField.addConstraint(NSLayoutConstraint.activate([
//            textField.leadingAnchor.constraint(equalTo: 15)
//        ]))
        return textField
    }()
    
    private let emailTextField: RIEmailTextField = {
        let textField = RIEmailTextField()
        return textField
    }()
    
    private let passwordTextField: RIPasswordTextField = {
        let textField = RIPasswordTextField()
        return textField
    }()
    
    private let selectionLanguage: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.selectionLanguage
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
        button.setTitle(Resourses.Strings.MainHeaders.registration, for: .normal)
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

// MARK: - Configurated

extension RegistrationView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [titleLabel,
                            nameTextField,
                            emailTextField,
                            passwordTextField,
                            selectionLanguage,
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
        selectionLanguage.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.leading.equalTo(passwordTextField)
        }
        customSwitchButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(34)
            make.trailing.equalTo(passwordTextField)
            make.size.equalTo(appearance.sizeButtonSwitch)
        }
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(selectionLanguage.snp.bottom).offset(35)
            make.leading.equalTo(selectionLanguage)
            make.centerX.equalToSuperview()
            make.size.equalTo(appearance.sizeButton)
        }
    }
    
    @objc func registration() {
        delegate?.registration()
    }
}
        
