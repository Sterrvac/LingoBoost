import UIKit
import Firebase

final class RegistrationViewController: UIViewController {
    
    private let presenterDelegate: RegistrationViewControllerOutput
    lazy var registrationView = RegistrationView(delegate: presenterDelegate as! RegistrationViewDelegate)
    
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

extension RegistrationViewController: RegistrationViewControllerInput {}

