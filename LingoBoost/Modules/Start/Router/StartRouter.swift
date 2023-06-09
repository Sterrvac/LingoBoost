import UIKit

final class StartRouter {
    weak var startViewController: UIViewController?
    
    func openAutorizationVC() {
        let autorizationViewController = AutorizationFactory().build()
        startViewController?.navigationController?.pushViewController(autorizationViewController, animated: true)
    }
    func openRegistrationVC() {
        let registrationViewController = RegistrationFactory().build()
        startViewController?.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    func openTrialModeVC() {
        let trialModeViewController = TrialModeFactory().build()
        startViewController?.navigationController?.pushViewController(trialModeViewController, animated: true)
    }
    func openAppleIdVC() {}
}
