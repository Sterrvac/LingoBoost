import UIKit
import SnapKit
import Firebase

protocol RegistrationViewDelegate {
    func registration(name: String, email: String, password: String)
    func showAlert()
}

final class RegistrationView: UIView {
    
    var delegate: RegistrationViewDelegate?
        
    var appearance = Appearance()
    
    private let keybouardButton: UIButton = {
        let button = UIButton()
        button.resignFirstResponder()
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.registration
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let nameTextField: RITextField = {
        let textField = RITextField()
        textField.configurateTextField(name: Resourses.Strings.MainHeaders.name,
                                       image: Resourses.Strings.Icons.person)
        textField.addTarget(nil, action: #selector(textFieldEditing), for: .editingChanged)
        return textField
    }()
    
    private let emailTextField: RITextField = {
        let textField = RITextField()
        textField.configurateTextField(name: Resourses.Strings.MainHeaders.email,
                                       image: Resourses.Strings.Icons.envelope)
        textField.addTarget(nil, action: #selector(textFieldEditing), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField: RITextField = {
        let textField = RITextField()
        textField.configurateTextField(name: Resourses.Strings.MainHeaders.password,
                                       image: Resourses.Strings.Icons.lock)
        textField.addTarget(nil, action: #selector(textFieldEditing), for: .editingChanged)
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
    
    lazy var registrationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle(Resourses.Strings.MainHeaders.registration, for: .normal)
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        return button
    }()
    
    init(frame: CGRect = UIScreen.main.bounds, delegate: RegistrationViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        backgroundColor = .systemGray
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldEditing(textField: RITextField) {
        guard let text = textField.text?.isEmpty else { return }
        if text {
            textField.stateRITextField(state: .placeholderShow)
        } else {
            textField.stateRITextField(state: .placeholderHeaden)
        }
    }
}

// MARK: - Configurated

extension RegistrationView {

    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [keybouardButton,
                            titleLabel,
                            nameTextField,
                            emailTextField,
                            passwordTextField,
                            selectionLanguage,
                            customSwitchButton,
                            registrationButton])
    }
    func configurationConstrantion() {
        keybouardButton.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
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
        let name = nameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            delegate?.registration(name: name, email: email, password: password)
        } else {
            delegate?.showAlert()
        }
    }
}
