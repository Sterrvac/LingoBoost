import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.showModelAuth()
            }
        }
        
        return true
    }
    func showModelAuth() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        self.coordinator = BaseCoordinator(navigationController: navigationController)
        coordinator?.start()
        window?.rootViewController = navigationController
    }
}

