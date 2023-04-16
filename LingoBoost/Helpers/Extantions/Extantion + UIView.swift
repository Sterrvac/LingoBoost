import UIKit

extension UIView {
    func addSubViews(items: [UIView]) {
        items.forEach { addSubview($0) }
    }
}
