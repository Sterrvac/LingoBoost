import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            print("user - \(String(describing: user))")
            if user == nil {
                self.showModelAuth()
            } else {
                self.showMainModel()
            }
        }
        return true
    }
    func showModelAuth() {
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        self.coordinator = BaseCoordinator(navigationController: navigationController)
        
        coordinator?.start()
        window?.rootViewController = navigationController
    }
    
    func showMainModel() {
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        self.coordinator = BaseCoordinator(navigationController: navigationController)
        
        coordinator?.startMain()
        window?.rootViewController = navigationController
    }
}

