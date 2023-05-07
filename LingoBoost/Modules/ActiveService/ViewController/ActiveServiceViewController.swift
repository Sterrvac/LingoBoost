import UIKit
import SnapKit

final class ActiveServiceViewController: UIViewController {
    
    private let presenterDelegate: ActiveServiceViewControllerOutput
    lazy var startView = ActiveServiceView(delegate: presenterDelegate as! ActiveServiceViewDelegate)
    
    init(presenterDelegate: ActiveServiceViewControllerOutput) {
        self.presenterDelegate = presenterDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StartViewControllerInput

extension ActiveServiceViewController: ActiveServiceViewControllerInput {
}

