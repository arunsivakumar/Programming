@testable import Refactoring
import FBSnapshotTestCase
import ViewControllerPresentationSpy

final class ChangePasswordViewControllerSnapshotTests: FBSnapshotTestCase {
    private var sut: ChangePasswordViewController!
    private var passwordChanger: MockPasswordChanger!
    private var alertVerifier: AlertVerifier!

    override func setUp() {
        super.setUp()
        recordMode = false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
                withIdentifier: String(
                        describing: ChangePasswordViewController.self))
                as? ChangePasswordViewController
        passwordChanger = MockPasswordChanger()
        sut.passwordChanger = passwordChanger
        alertVerifier = AlertVerifier()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        executeRunLoop() // Clean out UIWindow
        sut = nil
        passwordChanger = nil
        alertVerifier = nil
        super.tearDown()
    }
    
    func test_blur() {
        setUpValidPasswordEntries()

        tap(sut.submitButton)

        #if false
        FBSnapshotVerifyView(sut.view)
        #endif
        verifySnapshot()
    }
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField?.text = "NONEMPTY"
        sut.newPasswordTextField?.text = "123456"
        sut.confirmPasswordTextField?.text = sut.newPasswordTextField?.text
    }
    
    private func verifySnapshot(file: StaticString = #file, line: UInt = #line) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(sut.view)
        FBSnapshotVerifyView(sut.view, file: file, line: line)
    }
}
