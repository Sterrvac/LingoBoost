struct StartFactory{
    func build() -> StartViewController {
        let router = StartRouter()
        let presenter = StartPresentor(router: router)
        let interactor = StartInteractor(presenterDelegate: presenter)
        let viewController = StartViewController(presenterDelegate: presenter)
        
        router.startViewController = viewController
        
        presenter.viewController = viewController
        presenter.interactor = interactor
        return viewController
    }
}
