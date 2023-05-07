import UIKit

final class ActiveServiceRouter {
    weak var activeServiceViewController: UIViewController?
    
    func openAutorizationVC() {
        let autorizationViewController = AutorizationFactory().build()
        activeServiceViewController?.navigationController?.pushViewController(autorizationViewController, animated: true)
    }
    func openRegistrationVC() {
        let registrationViewController = RegistrationFactory().build()
        activeServiceViewController?.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    func openAppleIdVC() {}
}
