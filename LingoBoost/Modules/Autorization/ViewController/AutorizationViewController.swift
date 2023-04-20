import UIKit

final class AutorizationViewController: UIViewController {
    
    private let presenterDelegate: AutorizationViewControllerOutput
    var autorizationView = AutorizationView()
    
    init(presenterDelegate: AutorizationViewControllerOutput){
        self.presenterDelegate = presenterDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = autorizationView
    }
}

// MARK: - AutorizationViewController

extension AutorizationViewController: AutorizationViewControllerInput {}
