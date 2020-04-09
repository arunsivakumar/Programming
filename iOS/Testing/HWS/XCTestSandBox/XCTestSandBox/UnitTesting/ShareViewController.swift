
import UIKit

protocol SharePresenter {
    var title: String { get }
    func shareToInstagram()
}

struct ShareViewModel: SharePresenter {
    let title: String
    func shareToInstagram() {
        print("shared to instagram")
    }
}

class ShareViewController: UIViewController {
   
    var customView: UIView!
    var headerLabel = UILabel()
    
    var presenter: SharePresenter! {
        didSet {
            customView = ShareView(shareAction: shareContent)
            updateUI()
        }
    }
    
    override func loadView() {
        //setUpUI()
    }
    
    func updateUI() {
        headerLabel.text = presenter.title
    }
    
    func shareContent(text: String) {
        print("Sharing text...")
        presenter.shareToInstagram()
    }
}


class ShareView: UIView {
    
    var shareAction: (String) -> Void
    var textField: UITextField!
    
    init(shareAction: @escaping (String) -> Void) {
        
        self.shareAction = shareAction
        super.init(frame: .zero)
        
        textField = UITextField()
        
        textField.text = "Hello"
        //textField.sizeAndPositionHoweverYouWant()
        addSubview(textField)
        
        let button = UIButton(type: .system)
        //button.sizeAndPositionHoweverYouWant()
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        
        addSubview(textField)
        shareTapped()
        shareTapped()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) is not supported.")
    
    }
    
    @objc func shareTapped() {
        guard let text = textField?.text else {
            return
        }
        shareAction(text)
    }
}
