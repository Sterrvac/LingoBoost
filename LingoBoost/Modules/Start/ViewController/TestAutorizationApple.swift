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
    }
}
// MARK: - ASAuthorizationControllerDelegate
extension TestAutorizationApple: ASAuthorizationControllerDelegate {
    
}
// MARK: - ASAuthorizationControllerPresentationContextProviding
extension TestAutorizationApple: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return testView as! ASPresentationAnchor
    }
}
