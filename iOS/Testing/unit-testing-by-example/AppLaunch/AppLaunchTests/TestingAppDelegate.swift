import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions:
                    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("<< Launching with testing app delegate")

    #if false // Your app may have code that expects a root view controller to exist.
        window = UIWindow()
        window?.rootViewController = UIViewController()
    #endif

        print("Window: \(String(describing: window))")
        print("Root VC: \(String(describing: window?.rootViewController))")
        return true
    }
}
