import UIKit
import SnapKit

protocol AutorizationViewDelegate {
}

final class AutorizationView: UIView {
    
    var delegate: AutorizationViewDelegate?
    var appearance = Appearance()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.autorization
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let emailTextField: RITextField = {
        let textField = RITextField()
        textField.configurateTextField(name: Resourses.Strings.MainHeaders.email,
                                       image: Resourses.Strings.Icons.envelope)
        textField.addTarget(nil, action: #selector(emailTextFieldEditing), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField: RITextField = {
        let textField = RITextField()
        textField.configurateTextField(name: Resourses.Strings.MainHeaders.password,
                                       image: Resourses.Strings.Icons.lock)
        textField.addTarget(nil, action: #selector(passwordTextFieldEditing), for: .editingChanged)
        return textField
    }()
    
    private lazy var autorizationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle(Resourses.Strings.MainHeaders.autorization, for: .normal)
        button.addTarget(self, action: #selector(autorization), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPassword: UIButton = {
        let button = RIButton(type: .system)
        button.setTitle(Resourses.Strings.MainHeaders.forgotPassword, for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        return button
    }()
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func emailTextFieldEditing() {
        guard let text = emailTextField.text?.isEmpty else { return }
        if text {
            emailTextField.stateRITextField(state: .placeholderShow)
        } else {
            emailTextField.stateRITextField(state: .placeholderHeaden)
        }
    }
    @objc func passwordTextFieldEditing() {
        guard let text = passwordTextField.text?.isEmpty else { return }
        if text {
            passwordTextField.stateRITextField(state: .placeholderShow)
        } else {
            passwordTextField.stateRITextField(state: .placeholderHeaden)
        }
    }
}

// MARK: - Configurated

extension AutorizationView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [titleLabel,
                            emailTextField,
                            passwordTextField,
                            autorizationButton,
                            forgotPassword])
    }
    func configurationConstrantion() {
        titleLabel.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeTitle)
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeButton)
            make.center.equalToSuperview()
            make.leading.equalTo(25)
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
        }
        passwordTextField.snp.makeConstraints { make in
            make.size.equalTo(appearance.sizeButton)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.leading.equalTo(emailTextField)
        }
        autorizationButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.leading.equalTo(passwordTextField)
            make.centerX.equalToSuperview()
            make.size.equalTo(appearance.sizeButton)
        }
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(autorizationButton.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func autorization() {}
}
