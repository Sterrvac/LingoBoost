import UIKit

final class TrialModeRouter {
    weak var trialModeViewController: UIViewController?
    
    func openAutorizationVC() {
        let trialModeViewController = AutorizationFactory().build()
        trialModeViewController.navigationController?.pushViewController(trialModeViewController, animated: true)
    }
//    func openRegistrationVC() {
//        let registrationViewController = RegistrationFactory().build()
//        startViewController?.navigationController?.pushViewController(registrationViewController, animated: true)
//    }
}

