//
//  Tweet.swift
//  Smashtag
//
//  Created by Lakshmi on 11/20/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import Foundation
import CoreData
import Twitter


class Tweet: NSManagedObject
{

// Insert code here to add functionality to your managed object subclass
    
    class func tweetWithTwitterInfo(twitterInfo:Twitter.Tweet,inManagedObjectContext context:NSManagedObjectContext) -> Tweet?
    
    {
        // find in DB
        let request = NSFetchRequest(entityName:"Tweet")
        request.predicate = NSPredicate(format:"unique = %@",twitterInfo.id)
        
        if let tweet = (try? context.executeFetchRequest(request))?.first as? Tweet{
            return tweet
        }else  if let tweet = NSEntityDescription.insertNewObjectForEntityForName("Tweet", inManagedObjectContext: context) as? Tweet{ // create tweet
            tweet.unique = twitterInfo.id
            tweet.text = twitterInfo.text
            tweet.posted = twitterInfo.created
            tweet.tweeter = TwitterUser.twitterUserWithTwitterInfo(twitterInfo.user, inManagedObjectContext: context)
            return tweet
        }
        
//        
//        do {
//            let queryResults = try context.executeFetchRequest(request)
//            if let tweet = queryResults.first as? Tweet{
//                return tweet
//            }
//        } catch let error{
//            // ignore
//        }
        
        return nil
    }

}
