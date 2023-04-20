final class RegistrationPresenter{
    weak var viewController: RegistrationViewControllerInput?
    weak var interactor: RegistrationInteractorInput?
    let router: RegistrationRouter
    
    init(router: RegistrationRouter) {
        self.router = router
    }
}

extension RegistrationPresenter: RegistrationViewControllerOutput {

}

extension RegistrationPresenter: RegistrationViewDelegate {
//    func buttonTapped() {
//        router.openAutorizationVC()
//    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {}

