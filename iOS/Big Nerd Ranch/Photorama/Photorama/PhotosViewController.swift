//
//  ViewController.swift
//  Photorama
//
//  Created by Lakshmi on 5/13/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var store:PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

