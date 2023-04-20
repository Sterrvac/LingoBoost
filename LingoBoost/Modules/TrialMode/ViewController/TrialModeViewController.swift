import UIKit
import SnapKit

final class TrialModeViewController: UIViewController {
    
    private let presenterDelegate: TrialModeViewControllerOutput
    lazy var trialModeView = TrialModeView()
    
    init(presenterDelegate: TrialModeViewControllerOutput) {
        self.presenterDelegate = presenterDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = trialModeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StartViewControllerInput

extension TrialModeViewController: TrialModeViewControllerInput {
}
