import Foundation

final class StartPresentor{
    weak var viewController: StartViewControllerInput?
    weak var interactor: StartInteractorInput?
    let router: StartRouter
    
    init(router: StartRouter) {
        self.router = router
    }
}

extension StartPresentor: StartViewControllerOutput {

}

extension StartPresentor: StartViewDelegate {
    func buttonTapped() {
        router.openAutorizationVC()
    }
}

extension StartPresentor: StartInteractorOutput {}
