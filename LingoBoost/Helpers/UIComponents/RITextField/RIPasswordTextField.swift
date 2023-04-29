import UIKit
import SnapKit

// MARK: - RIPasswordTextField

final class RIPasswordTextField: RITextField {

    private let passwordIconView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Strings.Icons.lock
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userPassword: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.password
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RIPasswordTextField {
    func configuratedView() {
        addSubViews(items: [passwordIconView, userPassword])
    }
    func configurationConstrantion() {
        passwordIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(15)
        }
        userPassword.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIconView)
            make.leading.equalTo(passwordIconView.snp.trailing).offset(10)
        }
    }
}
