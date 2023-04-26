struct TrialModeFactory{
    func build() -> TrialModeViewController {
        let router = TrialModeRouter()
        let presenter = TrialModePresenter(router: router)
        let interactor = TrialModeInteractor(presenterDelegate: presenter)
        let viewController = TrialModeViewController(presenterDelegate: presenter as TrialModeViewControllerOutput)
        
        router.trialModeViewController = viewController
        
        presenter.viewController = viewController
        presenter.interactor = interactor as any TrialModeInteractorInput
        return viewController
    }
}

