
import UIKit

class ShareViewController: UIViewController {
   
    var customView: UIView!
    
    override func loadView() {
        customView = ShareView(shareAction: shareContent)
    }
    
    func shareContent(text: String) {
        print("Sharing text...")
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
