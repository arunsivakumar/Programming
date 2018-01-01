//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Lakshmi on 12/18/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    @IBOutlet var imageView:UIImageView!
    
    var photo:Photo!{
        didSet{
            navigationItem.title = photo.title
            
        }
    }
    
    var store:PhotoStore!
    
    override func viewDidLoad() {
        store.fetchImageForPhoto(photo) { (result) in
            switch result{
            case let .Success(image):
            NSOperationQueue.mainQueue().addOperationWithBlock(){
                self.imageView.image = image
            }
            case .Failure(_):
                print("Error")
                
            }
        }
    }
    
}
