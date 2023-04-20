final class TrialModePresenter{
    weak var viewController: TrialModeViewControllerInput?
    weak var interactor: TrialModeInteractorInput?
    let router: TrialModeRouter
    
    init(router: TrialModeRouter) {
        self.router = router
    }
}

extension TrialModePresenter: TrialModeViewControllerOutput {
}

extension TrialModePresenter: TrialModeViewDelegate {
//    func buttonTappedAutorization() {
//        router.openAutorizationVC()
//    }
//
//    func buttonTappedRegistration() {
//        router.openRegistrationVC()
//    }
}

extension TrialModePresenter: TrialModeInteractorOutput {}

