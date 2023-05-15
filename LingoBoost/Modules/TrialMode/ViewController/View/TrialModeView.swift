import UIKit
import SnapKit

protocol TrialModeViewDelegate {
    func logout()
}

final class TrialModeView: UIView {
    
    let delegate: TrialModeViewDelegate
    let boxWidth: CGFloat = 200
    
    lazy var logoutButton: RIButton = {
        let button = RIButton()
        button.setTitle("logout", for: .normal)
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()
    
    private let wordInBoxView: WordInBoxView = {
        let view = WordInBoxView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    init(frame: CGRect = UIScreen.main.bounds, delegate: TrialModeViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        backgroundColor = .systemGreen
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrialModeView {
    func configuratedView() {
        addSubViews(items: [logoutButton,
                            wordInBoxView,])
    }
    func configurationConstrantion() {
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(-40)
            make.trailing.equalToSuperview().offset(-15)
        }
        wordInBoxView.snp.makeConstraints { make in
            make.height.width.equalTo(boxWidth)
            make.center.equalToSuperview()
        }
    }
    @objc func logout() {
        delegate.logout()
    }
}
