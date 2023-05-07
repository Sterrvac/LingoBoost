import UIKit
import SnapKit
import AuthenticationServices

protocol StartViewDelegate {
    func buttonTrialMode()
}

final class StartView: UIView {
    
    var delegate: StartViewDelegate?
    
    var appearance = Appearance()
    
    private let lingoBoostTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.TextHeaders.lingoBoost
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let mainTextTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.text = Resourses.Strings.TextHeaders.mainTextStartView
        label.textColor = .systemGray
        return label
    }()
    
    private let descriptionTextTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.text = Resourses.Strings.TextHeaders.descriptionStartView
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var trialModeButton: RIButton = {
        let button = RIButton(type: .system)
        button.configurateButton()
        button.setTitle(Resourses.Strings.MainHeaders.start, for: .normal)
        button.addTarget(self, action: #selector(buttonTrialMode), for: .touchUpInside)
        button.backgroundColor = .systemGreen
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

// MARK: - Configurated

extension StartView {
    func configuratedView() {
        backgroundColor = .white
        addSubViews(items: [lingoBoostTitleLabel,
                            mainTextTitleLabel,
                            descriptionTextTitleLabel,
                            trialModeButton])
    }
    func configurationConstrantion() {
        lingoBoostTitleLabel.snp.makeConstraints { make in
            make.size.equalTo(self.appearance.sizeTitle)
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        mainTextTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(lingoBoostTitleLabel.snp.bottom).offset(25)
            make.size.equalTo(self.appearance.sizeText)
            make.leading.equalTo(25)
        }
        descriptionTextTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextTitleLabel.snp.bottom).offset(25)
            make.size.equalTo(self.appearance.sizeText)
            make.trailing.equalTo(-25)
        }
        trialModeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(25)
            make.size.equalTo(self.appearance.sizeButton)
        }
    }
    @objc func buttonTrialMode() {
        delegate?.buttonTrialMode()
    }
}
