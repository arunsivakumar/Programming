//
//  TwitterUser.swift
//  Smashtag
//
//  Created by Lakshmi on 11/20/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import Foundation
import CoreData
import Twitter

class TwitterUser: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    class func twitterUserWithTwitterInfo(twitterInfo: Twitter.User, inManagedObjectContext context: NSManagedObjectContext) -> TwitterUser?
    {
        let request = NSFetchRequest(entityName: "TwitterUser")
        request.predicate = NSPredicate(format: "screenName = %@", twitterInfo.screenName)
        if let twitterUser = (try? context.executeFetchRequest(request))?.first as? TwitterUser {
            return twitterUser
        } else if let twitterUser = NSEntityDescription.insertNewObjectForEntityForName("TwitterUser", inManagedObjectContext: context) as? TwitterUser {
            twitterUser.screenName = twitterInfo.screenName
            twitterUser.name = twitterInfo.name
            return twitterUser
        }
        return nil
    }

}
