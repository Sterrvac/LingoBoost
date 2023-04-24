import Foundation
import AuthenticationServices

//Сделать отдельным модулем AppleID
//Полная реализация проверки авторизации AppleID

final class TestAutorizationApple: ASAuthorizationController {
    
    let testView = UIView()
    
    override init(authorizationRequests: [ASAuthorizationRequest]) {
        super.init(authorizationRequests: authorizationRequests)
        delegate = self
        presentationContextProvider = self
        
        performRequests()
    }
}
// MARK: - ASAuthorizationControllerDelegate
extension TestAutorizationApple: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            
            let defaults = UserDefaults.standard
            defaults.set(userIdentifier, forKey: "userIdentifier1")
            
            //Save the UserIdentifier somewhere in your server/database
//            let vc = UserViewController()
//            vc.userID = userIdentifier
//            self.present(UINavigationController(rootViewController: vc), animated: true)
            break
        default:
            break
        }
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding
extension TestAutorizationApple: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return testView as! ASPresentationAnchor
    }
}
