import UIKit

protocol Coordinator {
    func start()
}

final class BaseCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registrationFactory = RegistrationFactory().build()
        
        navigationController.pushViewController(registrationFactory, animated: true)
    }
    
}
