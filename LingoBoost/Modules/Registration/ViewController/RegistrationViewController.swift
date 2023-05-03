import UIKit
import FirebaseAuth

final class RegistrationViewController: UIViewController {
    
    private let presenterDelegate: RegistrationViewControllerOutput
    var registrationView = RegistrationView()
    
    var signup :Bool = true{
        willSet{
            if newValue{
                registrationView.titleLabel.text = "Регистрация"
                registrationView.nameTextField.isHidden = false
                registrationView.registrationButton.setTitle("Войти", for: .normal)
            } else{
                registrationView.titleLabel.text = "Вход"
                registrationView.nameTextField.isHidden = true
                registrationView.registrationButton.setTitle("Регистрация", for: .normal)
            }
        }
    }
    
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
                    }
                }
            }
        }else {
            showAlert()
        }
        return true
    }
}
