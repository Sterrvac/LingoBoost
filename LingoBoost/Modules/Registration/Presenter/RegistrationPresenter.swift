import UIKit
import Firebase

final class RegistrationPresenter{
    weak var viewController: RegistrationViewControllerInput?
    weak var interactor: RegistrationInteractorInput?
    let router: RegistrationRouter
    
    init(router: RegistrationRouter) {
        self.router = router
    }
}

extension RegistrationPresenter: RegistrationViewControllerOutput {}

extension RegistrationPresenter: RegistrationViewDelegate {
    func registration(name: String, email: String, password: String) {
        print("name - \(name) email - \(email) password - \(password)")
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                if let result = result {
                    print("result - \(result.user.uid)")
                    let ref = Database.database().reference().child("users")
                    ref.child(result.user.uid).updateChildValues(["name" : name,"email" : email])
                }
            }
            self.router.showTrialMode()
        }
    }
    func showAlert() {
        router.showAlert()
    }
}
    
extension RegistrationPresenter: RegistrationInteractorOutput {}

