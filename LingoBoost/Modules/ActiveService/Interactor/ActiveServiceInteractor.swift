final class ActiveServiceInteractor {
    
    private let presenterDelegate: ActiveServiceInteractorOutput
    
    init(presenterDelegate: ActiveServiceInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
    
}

extension ActiveServiceInteractor: ActiveServiceInteractorInput {}
