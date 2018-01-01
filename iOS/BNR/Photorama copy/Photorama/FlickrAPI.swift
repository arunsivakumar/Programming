//
//  FlickerAPI.swift
//  Photorama
//
//  Created by Lakshmi on 12/18/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import Foundation


//“h​t​t​p​s​:​/​/​a​p​i​.​f​l​i​c​k​r​.​c​o​m​/​s​e​r​v​i​c​e​s​/​r​e​s​t​/​?​m​e​t​h​o​d​=​f​l​i​c​k​r​.​p​h​o​t​o​s​.​g​e​t​R​e​c​e​n​t
//&​a​p​i​_​k​e​y​=​a​6​d​8​1​9​4​9​9​1​3​1​0​7​1​f​1​5​8​f​d​7​4​0​8​6​0​a​5​a​8​8​&​e​x​t​r​a​s​=​u​r​l​_​h​,​d​a​t​e​_​t​a​k​e​n
//&​f​o​r​m​a​t​=​j​s​o​n​&​n​o​j​s​o​n​c​a​l​l​b​a​c​k​=​1​”


enum Method:String{
    case RecentPhotos = "flickr.photos.getRecent"
}

enum PhotosResult{
    case Success([Photo])
    case Failure(ErrorType)
}

enum flickrError:ErrorType{
    case InvalidJSONdata
}

struct FlickrAPI{
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    
    private static let APIKey = "fd3c0d32acfaca425895462a4194ee13"
    
    private static let dateFormatter:NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
       return formatter
    }()
    
    private static func flickrURL(method method :Method,parameters:[String:String]?)->NSURL?{

//        return NSURL()
        let components = NSURLComponents(string:baseURLString)!
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
        
        "method":method.rawValue,
        "format":"json",
        "nojsoncallback":"1",
        "api_key":APIKey
        ]
        
        for(key,value) in baseParams{
            let item = NSURLQueryItem(name:key,value:value)
            queryItems.append(item)
        }
        
        
        if let additionalParams = parameters{
            for(key,value) in additionalParams{
                let item = NSURLQueryItem(name:key,value:value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.URL!
    }
    
    static func recentPhotosURL() -> NSURL{
        return flickrURL(method:.RecentPhotos,parameters:["extras":"url_h,date_Taken"])!
    }
    
    static func photosFromJSONData(data:NSData)->PhotosResult{
        do{
            let jsonObject:AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: [])
           
        
            
            guard let jsonDictionary = jsonObject as? [NSObject:AnyObject], photos = jsonDictionary["photos"] as? [String:AnyObject],photosArray = photos["photo"] as? [[String:AnyObject]]
                else{
                    return .Failure(flickrError.InvalidJSONdata)
                }
            
             print(jsonDictionary)
            var finalPhotos = [Photo]()
            for photoJSON in photosArray{
                if let photo = photoFromJSONObject(photoJSON){
                    finalPhotos.append(photo)
                }
            }
            
            if finalPhotos.count == 0 && photosArray.count > 0{
                return .Failure(flickrError.InvalidJSONdata)
            }
            return .Success(finalPhotos)
        }catch let error{
            return .Failure(error)
        }
    }
    
    private static func photoFromJSONObject(json:[String:AnyObject]) ->Photo?{
        print(json)
        guard let photoId = json["id"] as? String,
            title = json["title"] as? String,
//            dateString  = json["datetaken"] as? String,
            photoURLstring = json["url_h"] as? String,
            url = NSURL(string:photoURLstring)
//            dateTaken = dateFormatter.dateFromString(dateString)
            else{
                return nil
        }
        
        return Photo(title: title, photoID: photoId, remoteURL: url, dateTaken: nil)
    }

}