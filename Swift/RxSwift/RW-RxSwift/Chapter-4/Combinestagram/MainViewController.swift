
import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

  private let bag = DisposeBag()
  private let images = BehaviorRelay<[UIImage]>(value: [])
  @IBOutlet weak var imagePreview: UIImageView!
  @IBOutlet weak var buttonClear: UIButton!
  @IBOutlet weak var buttonSave: UIButton!
  @IBOutlet weak var itemAdd: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    images.subscribe(onNext: { [weak imagePreview] photos in
      guard let preview = imagePreview else { return }
      preview.image = photos.collage(size: preview.frame.size)
    }).disposed(by: bag)
    
    images.subscribe(onNext: { [weak self] (photos) in
      self?.updateUI(photos: photos)
    }).disposed(by: bag)
  }
  
  private func updateUI(photos: [UIImage]) {
    buttonSave.isEnabled = photos.count > 0 && photos.count % 2 == 0
    buttonClear.isEnabled = photos.count > 0
    itemAdd.isEnabled = photos.count < 6
    title = photos.count > 0 ? "\(photos.count) photos" : "Collage"
  }
  
  @IBAction func actionClear() {
    images.accept([])
  }

  @IBAction func actionSave() {
    guard let image = imagePreview.image else { return }
    
    PhotoWriter.save(image)
    .subscribe(onSuccess: { [weak self] (id) in
        self?.showMessage("saved with id:\(id)")
        self?.actionClear()
      }) { [weak self] (error) in
        self?.showMessage("Error", description: error.localizedDescription)
    }.disposed(by: bag)
  }

  @IBAction func actionAdd() {
//    let newImages = images.value + [UIImage(named: "IMG_1907.jpg")!]
//    images.accept(newImages)
    
    let photosViewController = storyboard!.instantiateViewController(
      withIdentifier: "PhotosViewController") as! PhotosViewController


    navigationController!.pushViewController(photosViewController, animated: true)
    
    photosViewController.selectedPhotos
         .subscribe(
           onNext: { [weak self] newImage in
             guard let images = self?.images else { return }
             images.accept(images.value + [newImage])
           },
           onDisposed: {
             print("completed photo selection")
           }
         )
         .disposed(by: bag)
  }

  func showMessage(_ title: String, description: String? = nil) {
    alert(title: title, text: description)
       .subscribe()
       .disposed(by: bag)
  }
}


extension UIViewController {
  func alert(title: String, text: String?) -> Completable {
    return Completable.create { [weak self] completable in
      let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: {_ in
        completable(.completed)
      }))
      self?.present(alertVC, animated: true, completion: nil)
      return Disposables.create {
        self?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
