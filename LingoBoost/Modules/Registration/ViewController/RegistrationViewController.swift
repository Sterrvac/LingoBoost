import UIKit
import Firebase

final class RegistrationViewController: UIViewController {
    
    private let presenterDelegate: RegistrationViewControllerOutput
    private var registrationView = RegistrationView()
    
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
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension RegistrationViewController: RegistrationViewControllerInput {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = registrationView.nameTextField.text!
        let email = registrationView.emailTextField.text!
        let password = registrationView.passwordTextField.text!
        
        if(!name.isEmpty && !email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil{
                    if let result = result{
                        print(result.user.uid)
                        let ref = Database.database().reference().child("users")
                        ref.child(result.user.uid).updateChildValues(["name" : name,"email" : email])
                    }
                }
            }
        }else {
            showAlert()
        }
        return true
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.nameTextField.delegate = self
        registrationView.emailTextField.delegate = self
        registrationView.passwordTextField.delegate = self
    }
}
