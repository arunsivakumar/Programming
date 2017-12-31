//
//  ViewController.swift
//  Cassini
//
//  Created by Lakshmi on 10/23/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
             scrollView.contentSize = imageView.frame.size
             scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    var imageURL:NSURL?{
        didSet{
            image = nil
            if view.window != nil{ // if i am on view
                fetchImage() // no segues for reusing code last 10 min
            }
        }
    }
    
    // iphone everytime new mvs
    // i[pad reuse mvc
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image:UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
        
    }
    
    
    private func fetchImage(){
        if let url = imageURL{
            spinner?.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                let contentsOfURL = NSData(contentsOfURL:url)
                dispatch_async(dispatch_get_main_queue()){
                    if url == self.imageURL{ // check if it the same request
                        if let imageData = contentsOfURL{
                            self.image = UIImage(data:imageData)
                        }else{
                            self.spinner?.stopAnimating() // carefult if no data found
                        }
                    }else{
                        print("ignored data returned from \(url)")
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView?.addSubview(imageView)
//        imageURL = DemoURL.Stanford
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage()
        }
    }
}

