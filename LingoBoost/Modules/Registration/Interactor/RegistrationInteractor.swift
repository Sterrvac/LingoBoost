final class RegistrationInteractor{
    
    private let presenterDelegate: RegistrationInteractorOutput
    
    init(presenterDelegate: RegistrationInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
}

extension RegistrationInteractor: RegistrationInteractorInput {}
