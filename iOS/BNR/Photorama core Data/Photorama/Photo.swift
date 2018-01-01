//
//  Photo.swift
//  Photorama
//
//  Created by Lakshmi on 12/19/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

//import Foundation
import CoreData
import UIKit

class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    var image:UIImage?
    
    override func awakeFromInsert() {
        title = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }
}
