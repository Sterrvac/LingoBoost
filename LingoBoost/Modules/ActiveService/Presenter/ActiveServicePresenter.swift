final class ActiveServicePresenter {
    weak var viewController: ActiveServiceViewControllerInput?
    weak var interactor: ActiveServiceInteractorInput?
    let router: ActiveServiceRouter
    
    init(router: ActiveServiceRouter) {
        self.router = router
    }
}

extension ActiveServicePresenter: ActiveServiceViewControllerOutput {

}

extension ActiveServicePresenter: ActiveServiceViewDelegate {
    func buttonAutorization() {
        router.openAutorizationVC()
    }
    func buttonRegistration() {
        router.openRegistrationVC()
    }
    func buttonAppleId() {
        router.openAppleIdVC()
    }
}

extension ActiveServicePresenter: ActiveServiceInteractorOutput {
    func getFirebaseString() {
    }
}
