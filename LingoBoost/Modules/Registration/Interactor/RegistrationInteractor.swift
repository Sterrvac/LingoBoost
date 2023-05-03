final class RegistrationInteractor{
    
    private let presenterDelegate: RegistrationInteractorOutput
    
    init(presenterDelegate: RegistrationInteractorOutput) {
        self.presenterDelegate = presenterDelegate
    }
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func getRegistrationData() {
//        guard let stringURL = "https://\(authorizedDomain).firebaseapp.com/login?email=\(email)"
    }
}
