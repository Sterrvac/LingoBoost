struct RegistrationFactory{
    func build() -> RegistrationViewController {
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter(router: router)
        let interactor = RegistrationInteractor(presenterDelegate: presenter)
        let viewController = RegistrationViewController(presenterDelegate: presenter)
        
        router.registrationViewController = viewController
        
        presenter.viewController = viewController as? any RegistrationViewControllerInput
        presenter.interactor = interactor
        return viewController
    }
}
