import UIKit
import SnapKit

protocol TrialModeViewDelegate {
    func logout()
}

final class TrialModeView: UIView {
    
    let delegate: TrialModeViewDelegate
    
    lazy var logoutButton: RIButton = {
        let button = RIButton()
        button.setTitle("logout", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
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
        addSubViews(items: [logoutButton])
    }
    func configurationConstrantion() {
        logoutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    @objc func logout() {
        delegate.logout()
    }
}
