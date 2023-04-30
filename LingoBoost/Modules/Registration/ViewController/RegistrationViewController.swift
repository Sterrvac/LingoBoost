import UIKit
import FirebaseAuth

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
    
    var handle = Auth.auth().addStateDidChangeListener { auth, user in
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle)
    }
}

extension AutorizationViewController: RegistrationViewControllerInput {}
