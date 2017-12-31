//
//  DemoURL.swift
//  Cassini
//
//  Created by Lakshmi on 10/23/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Stanford = NSURL(string: "http://stanfordreview.org/wp-content/uploads/palm_drive.jpg")
//    struct NASA {
//        static let Cassini = NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
//        static let Earth = NSURL(string: "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg")
//        static let Saturn = NSURL(string: "http://www.nasa.gov/sites/default/files/saturn_collage.jpg")
//    }
    static let NASA = [
        "Cassini":"http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth": "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn": "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    
    ]
    
    static func NASAImageNamed(imageName:String?) -> NSURL?{
        if let urlstring = NASA[imageName ?? ""]{
            return NSURL(string:urlstring)
        }else{
            return nil
        }
    }
}