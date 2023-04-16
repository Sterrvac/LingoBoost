import UIKit

protocol AutorizationViewContollerDelegate{}

final class AutorizationViewController: UIViewController {
    var autorizationView = AutorizationView()
    
    init(autorizationView: AutorizationView = AutorizationView()) {
        self.autorizationView = autorizationView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = autorizationView
    }
}
