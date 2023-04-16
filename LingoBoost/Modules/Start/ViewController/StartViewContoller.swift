import UIKit
import SnapKit

final class StartViewController: UIViewController {
    
    private let presenterDelegate: StartViewControllerOutput
    lazy var registrationView = StartView(delegate: presenterDelegate as! StartViewDelegate)
    
    init(presenterDelegate: StartViewControllerOutput) {
        self.presenterDelegate = presenterDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - RegistrationViewControllerInput

extension StartViewController: StartViewControllerInput {
}

