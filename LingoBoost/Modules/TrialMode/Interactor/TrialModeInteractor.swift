final class TrialModeInteractor {
    
    private let presenterDelegate: TrialModeInteractorOutput
    
    init(presenterDelegate: TrialModeInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
    
}

extension TrialModeInteractor: TrialModeInteractorInput {}
