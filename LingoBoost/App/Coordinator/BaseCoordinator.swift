import UIKit

protocol Coordinator {
    func start()
    func startMain()
}

final class BaseCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registrationFactory = StartFactory().build()
        
        navigationController.setViewControllers([registrationFactory], animated: true)
    }
    func startMain() {
        let trialModeFactory = TrialModeFactory().build()
        
        navigationController.setViewControllers([trialModeFactory], animated: true)
    }
}
