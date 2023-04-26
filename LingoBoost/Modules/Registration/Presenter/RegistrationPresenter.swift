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
    func registration() {}
}

extension RegistrationPresenter: RegistrationInteractorOutput {}

