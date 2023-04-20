import UIKit

final class RegistrationViewController: UIViewController {
    
    private let presenterDelegate: RegistrationViewControllerOutput
    var registrationView = RegistrationView()
    
    init(presenterDelegate: RegistrationViewControllerOutput){
        self.presenterDelegate = presenterDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = registrationView
    }
}

extension AutorizationViewController: RegistrationViewControllerInput {}
