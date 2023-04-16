final class StartInteractor {
    
    private let presenterDelegate: StartInteractorOutput
    
    init(presenterDelegate: StartInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
    
}

extension StartInteractor: StartInteractorInput {}
