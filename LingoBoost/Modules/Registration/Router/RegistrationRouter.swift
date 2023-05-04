import UIKit

final class RegistrationRouter {
    weak var registrationViewController: UIViewController?
    
    func showTrialMode() {
        let trialMode = TrialModeFactory().build()
        registrationViewController?.navigationController?.pushViewController(trialMode, animated: true)
    }
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        registrationViewController?.present(alert, animated: true, completion: nil)
    }
}
