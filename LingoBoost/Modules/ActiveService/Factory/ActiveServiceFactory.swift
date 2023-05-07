struct ActiveServiceFactory{
    func build() -> ActiveServiceViewController {
        let router = ActiveServiceRouter()
        let presenter = ActiveServicePresenter(router: router)
        let interactor = ActiveServiceInteractor(presenterDelegate: presenter)
        let viewController = ActiveServiceViewController(presenterDelegate: presenter)
        
        router.activeServiceViewController = viewController
        
        presenter.viewController = viewController
        presenter.interactor = interactor
        return viewController
    }
}
