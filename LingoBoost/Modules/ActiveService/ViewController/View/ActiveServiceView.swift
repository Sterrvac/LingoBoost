import UIKit
import SnapKit
import AuthenticationServices

protocol ActiveServiceViewDelegate {
    func buttonAutorization()
    func buttonRegistration()
    func buttonAppleId()
}

final class ActiveServiceView: UIView {
    
    var delegate: ActiveServiceViewDelegate?
    
    var appearance = Appearance()

    private lazy var autorizationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle(Resourses.Strings.MainHeaders.autorization, for: .normal)
        button.addTarget(self, action: #selector(buttonAutorization), for: .touchUpInside)
        return button
    }()
    
    private lazy var registrationButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle(Resourses.Strings.MainHeaders.registration, for: .normal)
        button.addTarget(self, action: #selector(buttonRegistration), for: .touchUpInside)
        return button
    }()
    
    private lazy var appleLogInButton : ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleLogInWithAppleID), for: .touchUpInside)
        button.cornerRadius = 15
        return button
    }()
    
    init(frame: CGRect = UIScreen.main.bounds, delegate: ActiveServiceViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configurated

extension ActiveServiceView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [registrationButton,
                            autorizationButton,
                            appleLogInButton])
    }
    func configurationConstrantion() {
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
        appleLogInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(appleLogInButton.snp.bottom).offset(50)
            make.size.equalTo(self.appearance.sizeButtonAuto)
        }
    }
    
    @objc func buttonAutorization() {
        delegate?.buttonAutorization()
    }
    @objc func buttonRegistration() {
        delegate?.buttonRegistration()
    }
    // Должен вызываться отдельный модуль
    @objc func handleLogInWithAppleID() {
        delegate?.buttonAppleId()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
     }
}
