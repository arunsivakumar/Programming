//
//  ViewController.swift
//  ImagePickerExperiment
//
//  Created by Arun Sivakumar on 8/28/16.
//  Copyright © 2016 Arun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imagePickerView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.whiteColor() //TODO: Fill in appropriate UIColor,
            NSForegroundColorAttributeName : UIColor.blackColor() //TODO: Fill in UIColor,
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : //TODO: Fill in appropriate Float
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pickAnImage(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
}

