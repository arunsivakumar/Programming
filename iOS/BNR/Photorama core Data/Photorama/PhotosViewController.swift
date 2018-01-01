//
//  ViewController.swift
//  Photorama
//
//  Created by Lakshmi on 12/18/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController,UICollectionViewDelegate {
    

//    @IBOutlet weak var imageView: UIImageView!
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoDataSource = PhotoDataSource()
    
    var store:PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchRecentPhotos { (photosResult) in
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                switch photosResult{
                case let .Success(photos):
                    print(" Sucessfully found \(photos.count)")
                    self.photoDataSource.photos = photos
                case let .Failure(error):
                    print("Error downloading image : \(error)")
                }
                self.collectionView.reloadSections(NSIndexSet(index:0))
            })
//            switch photosResult{
//            case let .Success(photos):
//                print(" Sucessfully found \(photos.count)")
//                
//                if let firstPhoto = photos.first{
//                    self.store.fetchImageForPhoto(firstPhoto, completion: { (imageResult) in
//                        switch imageResult{
//                        case let .Success(image):
//                            NSOperationQueue.mainQueue().addOperationWithBlock({ 
//                                 self.imageView.image = image
//                            })
//                           
//                        case let .Failure(error):
//                            print("Error downloading image : \(error)")
//                        }
//                    })
//                }
//            case let .Failure(error):
//                print("Error fetching recent photos:\(error)")
//            }
        }

    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
       
        let photo = photoDataSource.photos[indexPath.row]
        
        store.fetchImageForPhoto(photo
            , completion: { (result) in
                NSOperationQueue.mainQueue().addOperationWithBlock (){
                    
                      let photoIndex = self.photoDataSource.photos.indexOf(photo)!
                    let photoIndexPath = NSIndexPath(forRow:photoIndex, inSection:0)
                    if let cell = self.collectionView.cellForItemAtIndexPath(photoIndexPath) as? PhotoCollectionViewCell{
                        cell.updateWithImage(photo.image)
                    }
                }
        })
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPhoto"{
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems()?.first{
                let photo = photoDataSource.photos[selectedIndexPath.row]
                
                let destinationVC = segue.destinationViewController as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            }
        }
    }
}

