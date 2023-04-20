import Foundation

final class AutorizationPresentor{
    weak var viewController: AutorizationViewControllerInput?
    weak var interactor: AutorizationInteractorInput?
    let router: AutorizationRouter
    
    init(router: AutorizationRouter) {
        self.router = router
    }
}

extension AutorizationPresentor: AutorizationViewControllerOutput {

}

extension AutorizationPresentor: AutorizationViewDelegate {
//    func buttonTapped() {
//        router.openAutorizationVC()
//    }
}

extension AutorizationPresentor: AutorizationInteractorOutput {}

