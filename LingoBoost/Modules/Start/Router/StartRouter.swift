import UIKit

final class StartRouter {
    weak var startViewController: UIViewController?
    
    func openAutorizationVC() {
        let autorizationViewController = AutorizationFactory().build()
        startViewController?.navigationController?.pushViewController(autorizationViewController, animated: true)
    }
}
