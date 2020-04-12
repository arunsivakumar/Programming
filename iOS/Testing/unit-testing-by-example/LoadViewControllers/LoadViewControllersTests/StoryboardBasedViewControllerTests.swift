@testable import LoadViewControllers
import XCTest

class StoryboardBasedViewControllerTests: XCTestCase {

    #if false
    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateViewController(
                withIdentifier: String(
                        describing: StoryboardBasedViewController.self))
    }
    #endif

    #if true
    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateViewController(
                withIdentifier: String(
                        describing: StoryboardBasedViewController.self))
                as! StoryboardBasedViewController

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.label)
    }
    #endif

    #if false
    func test_loading_safeButMayBeOverkill() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let className = String(describing: StoryboardBasedViewController.self)
        let rawVC = sb.instantiateViewController(withIdentifier: className)
        guard let sut = rawVC as? StoryboardBasedViewController else {
            XCTFail("Expected \(className), but was \(rawVC)")
            return
        }

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.label)
    }
    #endif
}
