import UIKit

final class StartRouter {
    weak var registrationViewController: UIViewController?
    
    func openAutorizationVC() {
        let autorizationViewController = RegistrationFactory().build()
        registrationViewController?.navigationController?.pushViewController(autorizationViewController, animated: true)
    }
}
