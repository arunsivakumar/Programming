//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Lakshmi on 5/13/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation

enum FlickrError: Error {
    case invalidJSONData
}
enum Method:String{
    case integestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI{
    
    static var interestingPhotosURL: URL {
        return flickrURL(method: .integestingPhotos,
                         parameters: ["extras": "url_h,date_taken"])
    }
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "fd3c0d32acfaca425895462a4194ee13"

    
    private static func flickrURL(method: Method,
                                     parameters: [String:String]?) -> URL {
        
//        return URL(string: "")!
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
         for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static func photos(fromJSON data: Data) -> PhotosResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data,
                                                              options: [])
            
            var finalPhotos = [Photo]()
            return .success(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
   
}
