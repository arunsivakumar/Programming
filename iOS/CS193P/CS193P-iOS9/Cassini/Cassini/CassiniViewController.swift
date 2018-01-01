//
//  Cassini.swift
//  Cassini
//
//  Created by Lakshmi on 10/23/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController,UISplitViewControllerDelegate {
    
    private struct Storyboard{
        static let ShowImageSegue = "Show Image"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.ShowImageSegue{
//            if let ivc = (segue.destinationViewController as? ImageViewController){
            if let ivc = (segue.destinationViewController.contentViewController as? ImageViewController){

//                if let sendingButton = sender as? UIButton{
//                    let imageName = sendingButton.currentTitle
//                }
                 let imageName = (sender as? UIButton)?.currentTitle
                 ivc.imageURL = DemoURL.NASAImageNamed(imageName)
                ivc.title = imageName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contentViewController == self{
            if let ivc = secondaryViewController.contentViewController as? ImageViewController where ivc.imageURL == nil{
                return true
            }
        }
        return false
    }

}


extension UIViewController{
    
    var contentViewController:UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }else{
            return self
        }
    }
}