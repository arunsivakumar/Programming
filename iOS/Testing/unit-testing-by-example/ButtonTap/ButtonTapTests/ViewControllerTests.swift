@testable import ButtonTap
import XCTest

class ViewControllerTests: XCTestCase {

    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
                withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()

        #if false
        sut.button.sendActions(for: .touchUpInside)
        #endif
        tap(sut.button)

        // Normally, assert something
    }
}
