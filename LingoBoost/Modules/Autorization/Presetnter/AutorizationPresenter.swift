final class AutorizationPresenter{
    weak var viewController: AutorizationViewControllerInput?
    weak var interactor: AutorizationInteractorInput?
    let router: AutorizationRouter
    
    init(router: AutorizationRouter) {
        self.router = router
    }
}

extension AutorizationPresenter: AutorizationViewControllerOutput {

}

extension AutorizationPresenter: AutorizationViewDelegate {
//    func buttonTapped() {
//        router.openAutorizationVC()
//    }
}

extension AutorizationPresenter: AutorizationInteractorOutput {}

