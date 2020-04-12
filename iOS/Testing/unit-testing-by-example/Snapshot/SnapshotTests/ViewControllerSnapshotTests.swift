@testable import Snapshot
import FBSnapshotTestCase

class ViewControllerSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func test_example() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
                withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()

        FBSnapshotVerifyView(sut.view)
    }
}

