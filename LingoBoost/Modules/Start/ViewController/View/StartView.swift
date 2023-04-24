import UIKit
import SnapKit
import AuthenticationServices

protocol StartViewDelegate {
    func buttonAutorization()
    func buttonRegistration()
    func buttonTrialMode()
    func buttonAppleId()
}

// MARK: - Appearance

extension StartView {
    struct Appearance {
        let sizeButton: CGSize = CGSize(width: 400, height: 50)
        let sizeButtonAuto: CGSize = CGSize(width: 200, height: 50)
        let sizeTitle: CGSize = CGSize(width: 400, height: 70)
        let sizeText: CGSize = CGSize(width: 300, height: 50)
    }
}

final class StartView: UIView {
    
    var delegate: StartViewDelegate?
    
    var appearance = Appearance()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NameApplication"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.text = "Увеличиваем запаc слов на иностранных языках!"
        label.textColor = .systemGray
        return label
    }()
    
    private let textTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.text = "Добавляй интересующие тебя слова повторяй их в любое время!"
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var autorizationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle("Autorization", for: .normal)
        button.addTarget(self, action: #selector(buttonAutorization), for: .touchUpInside)
        return button
    }()
    
    private lazy var registrationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle("Registration", for: .normal)
        button.addTarget(self, action: #selector(buttonRegistration), for: .touchUpInside)
        return button
    }()
    
    private lazy var trialModeButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle("TestMode", for: .normal)
        button.addTarget(self, action: #selector(buttonTrialMode), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    private lazy var appleLogInButton : ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleLogInWithAppleID), for: .touchUpInside)
        return button
    }()

    init(frame: CGRect = UIScreen.main.bounds, delegate: StartViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StartView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [titleLabel,
                            subTitleLabel,
                            textTitleLabel,
                            registrationButton,
                            autorizationButton,
                            trialModeButton,
                            appleLogInButton])
    }
    func configurationConstrantion() {
        titleLabel.snp.makeConstraints { make in
            make.size.equalTo(self.appearance.sizeTitle)
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.size.equalTo(self.appearance.sizeText)
            make.leading.equalTo(25)
        }
        textTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(25)
            make.size.equalTo(self.appearance.sizeText)
            make.trailing.equalTo(-25)
        }
        registrationButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(25)
            make.size.equalTo(self.appearance.sizeButton)
        }
        autorizationButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registrationButton.snp.bottom).offset(25)
            make.leading.equalTo(registrationButton)
            make.size.equalTo(self.appearance.sizeButton)
        }
        trialModeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(autorizationButton.snp.bottom).offset(25)
            make.leading.equalTo(autorizationButton)
            make.size.equalTo(self.appearance.sizeButton)
        }
        appleLogInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(trialModeButton.snp.bottom).offset(50)
            make.size.equalTo(self.appearance.sizeButtonAuto)
            
        }
    }
    
    @objc func buttonAutorization() {
        delegate?.buttonAutorization()
    }
    @objc func buttonRegistration() {
        delegate?.buttonRegistration()
    }
    @objc func buttonTrialMode() {
        delegate?.buttonTrialMode()
    }
    // Должен вызываться отдельный модуль
    @objc func handleLogInWithAppleID() {
        delegate?.buttonAppleId()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
     }
}
