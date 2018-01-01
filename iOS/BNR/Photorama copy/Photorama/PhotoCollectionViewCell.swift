//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Lakshmi on 12/18/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageview :UIImageView!
    @IBOutlet var spinner:UIActivityIndicatorView!
    
    
    func updateWithImage(image:UIImage?){
        if let imageToDisplay = image{
            spinner.stopAnimating()
            imageview.image = imageToDisplay
            
        }else{
            spinner.startAnimating()
            imageview.image = nil
        }
    }
    override func awakeFromNib(){
        updateWithImage(nil)
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        updateWithImage(nil)
    }
}
