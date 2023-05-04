import Firebase

final class TrialModePresenter{
    weak var viewController: TrialModeViewControllerInput?
    weak var interactor: TrialModeInteractorInput?
    let router: TrialModeRouter
    
    init(router: TrialModeRouter) {
        self.router = router
    }
}

extension TrialModePresenter: TrialModeViewControllerOutput {
}

extension TrialModePresenter: TrialModeViewDelegate {
    func logout() {
        do {
            try Auth.auth().signOut()
            self.router.openAutorizationVC()
        } catch {
            print(error)
        }
    }
}

extension TrialModePresenter: TrialModeInteractorOutput {
    func getFirebaseString() {}
}

