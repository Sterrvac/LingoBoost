final class AutorizationInteractor{
    
    private let presenterDelegate: AutorizationInteractorOutput
    
    init(presenterDelegate: AutorizationInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
}

extension AutorizationInteractor: AutorizationInteractorInput {}
