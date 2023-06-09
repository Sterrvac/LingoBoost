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
    func buttonAppleId() {
        router.openAppleIdVC()
    }
    
    func buttonAutorization() {
        router.openAutorizationVC()
    }
    
    func buttonRegistration() {
        router.openRegistrationVC()
    }
    
    func buttonTrialMode() {
        router.openTrialModeVC()
    }
}

extension StartPresenter: StartInteractorOutput {}
