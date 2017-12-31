//
//  SmashTweetTableViewController.swift
//  SmashTag
//
//  Created by Lakshmi on 5/17/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit
import Twitter
import CoreData


class SmashTweetTableViewController: TweetTableViewController {

    
    var container:NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate?)??.persistentContainer
    
    override func insertTweets(_ newTweets:[Twitter.Tweet]){
        
        super.insertTweets(newTweets)
        updateDatabase(with:newTweets)
    }
    
    private func updateDatabase(with tweets: [Twitter.Tweet]) {
        print("starting database load")
        container?.performBackgroundTask { [weak self] context in
            for twitterInfo in tweets {
                _ = try? Tweet.findOrCreateTweet(matching: twitterInfo, in: context)
            }
            try? context.save()
            print("done loading database")
            self?.printDatabaseStatistics()
        } }
    
    
    private func printDatabaseStatistics() {
        if let context = container?.viewContext {
            context.perform {
                if Thread.isMainThread {
                    print("on main thread")
                } else {
                    print("off main thread")
                }
                // bad way to count
//                if let tweetCount = (try? context.fetch(Tweet.fetchRequest()))?.count {
//                    print("\(tweetCount) tweets")
//                }
                // good way to count
                if let tweeterCount = try? context.count(for: TwitterUser.fetchRequest()) {
                    print("\(tweeterCount) Twitter users")
                }
            } }
    }
    
}
