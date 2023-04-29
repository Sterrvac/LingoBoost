import UIKit
import SnapKit

// MARK: - RINameTextField

final class RINameTextField: RITextField {

    private let personIconView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Strings.Icons.person
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.MainHeaders.name
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

extension RINameTextField {
    func configuratedView() {
        addSubViews(items: [personIconView, userName])
    }
    func configurationConstrantion() {
        personIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(15)
        }
        userName.snp.makeConstraints { make in
            make.centerY.equalTo(personIconView)
            make.leading.equalTo(personIconView.snp.trailing).offset(10)
        }
    }
}
