import UIKit
import SnapKit

// MARK: - RIEmailTextField

final class RIEmailTextField: RITextField {

    private let emailIconView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Strings.Icons.envelope
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userEmail: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.email
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

extension RIEmailTextField {
    func configuratedView() {
        addSubViews(items: [emailIconView, userEmail])
    }
    func configurationConstrantion() {
        emailIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(15)
        }
        userEmail.snp.makeConstraints { make in
            make.centerY.equalTo(emailIconView)
            make.leading.equalTo(emailIconView.snp.trailing).offset(10)
        }
    }
}
