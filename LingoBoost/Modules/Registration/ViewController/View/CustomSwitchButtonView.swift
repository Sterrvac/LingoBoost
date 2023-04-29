import UIKit
import SnapKit

// MARK: - CustomSwitchButton

final class CustomSwitchButton: UIButton {
    
    private let language: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.Language.english
        label.textColor = .systemGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.down")
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configuratedView()
        configurationConstrantion()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomSwitchButton {
    func configuratedView() {
        addSubViews(items: [language, iconView])
    }
    func configurationConstrantion() {
        language.snp.makeConstraints { make in
            make.leading.equalTo(5)
        }
        iconView.snp.makeConstraints { make in
            make.trailing.equalTo(-5)
        }
    }
}
