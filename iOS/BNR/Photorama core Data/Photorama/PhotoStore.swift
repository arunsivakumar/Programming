//
//  PhotoStore.swift
//  Photorama
//
//  Created by Lakshmi on 12/18/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

//import Foundation

import UIKit
import CoreData

enum ImageResult{
    case Success(UIImage)
    case Failure(ErrorType)
}

enum PhotoError:ErrorType{
    case ImageCreationError
}


//NSURLSessionDataTask
//NSURLSessionDownloadTask
//NSURLSessionUploadTask
class PhotoStore{
    
    let coreDataStack = CoreDataStack(modelName:"Photorama")
    
    
    let session:NSURLSession = {
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration:config)
    }()
    
    func fetchRecentPhotos(completion completion:(PhotosResult) -> Void){
        
        let url = FlickrAPI.recentPhotosURL()
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request){
            (data,response,error)-> Void in
//            
//            if let jsonData = data{
////                if let jsonString = NSString(data:jsonData,encoding:NSUTF8StringEncoding){
////                    print(jsonString)
////                }
//                
//                do{
//                    let jsonObject:AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
//                    print(jsonObject)
//                }catch let error {
//                    print("error creating JSON :\(error)")
//                }
//            }else if let requestError = error{
//                print("Error fetching data: \(requestError)")
//            }else{
//                 print("unexpected error")
//            }
            
//            let result = self.processRecentPhotoRequest(data:data,error:error) commented later
            
            var result = self.processRecentPhotoRequest(data:data,error:error)
            if case let .Success(photos) = result{
                do{
                    try self.coreDataStack.saveChanges()
                }catch let error{
                    result = .Failure(error)
                }
            }
            
            completion(result)
        }
        task.resume()
    }
    
    func processRecentPhotoRequest(data data:NSData?,error:NSError?) -> PhotosResult{
        guard let jsonData = data else{
            return .Failure(error!)
        }
        return FlickrAPI.photosFromJSONData(jsonData,inContext: self.coreDataStack.managedObjectContext)
    }
    
    func fetchImageForPhoto(photo:Photo,completion:(ImageResult)->Void){
        
        if let image = photo.image{
            completion(.Success(image))
            return
        }
        let photoURL = photo.remoteURL
        let request = NSURLRequest(URL:photoURL)
        
        let task = session.dataTaskWithRequest(request){
            (data,response,error)-> Void in
            
            let result = self.processImagerequest(data: data, error: error)
            
            if case let .Success(image) = result{
                photo.image = image
            }
            
            completion(result)
        }
         task.resume()
    }
    
    func processImagerequest(data data:NSData?,error:NSError?)->ImageResult{
        guard let imageData = data,image = UIImage(data:imageData)else{
            if data == nil{
                return .Failure(error!)
            }else{
                return .Failure(PhotoError.ImageCreationError)
            }
        }
        
        return .Success(image)
    }
    
}