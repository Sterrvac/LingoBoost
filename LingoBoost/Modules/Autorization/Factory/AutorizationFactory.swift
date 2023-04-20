struct AutorizationFactory{
    func build() -> AutorizationViewController {
        let router = AutorizationRouter()
        let presenter = AutorizationPresenter(router: router)
        let interactor = AutorizationInteractor(presenterDelegate: presenter)
        let viewController = AutorizationViewController(presenterDelegate: presenter)
        
        router.autorizationViewController = viewController
        
        presenter.viewController = viewController
        presenter.interactor = interactor
        return viewController
    }
}
