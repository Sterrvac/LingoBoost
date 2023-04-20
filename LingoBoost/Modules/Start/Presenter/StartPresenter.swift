final class StartPresenter{
    weak var viewController: StartViewControllerInput?
    weak var interactor: StartInteractorInput?
    let router: StartRouter
    
    init(router: StartRouter) {
        self.router = router
    }
}

extension StartPresenter: StartViewControllerOutput {

}

extension StartPresenter: StartViewDelegate {
    func buttonTappedAutorization() {
        router.openAutorizationVC()
    }
    
    func buttonTappedRegistration() {
        router.openRegistrationVC()
    }
    
    func buttonTappedTrialMode() {
        router.openTrialModeVC()
    }
}

extension StartPresenter: StartInteractorOutput {}
