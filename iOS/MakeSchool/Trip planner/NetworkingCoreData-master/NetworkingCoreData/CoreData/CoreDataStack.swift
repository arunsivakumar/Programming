//
//  CoreDataStackInMemory.swift
//  TripPlanner
//
//  Created by Benjamin Encz on 7/20/15.
//  Copyright © 2015 Make School. All rights reserved.
//

// Structure is inspired by: http://martiancraft.com/blog/2015/03/core-data-stack/, Thanks!

import Foundation
import CoreData

enum CoreDataStackType {
  case inMemory, sqLite
}

class CoreDataStack {
  
  fileprivate(set) var managedObjectContext: NSManagedObjectContext
    
  fileprivate var storeCoordinator: NSPersistentStoreCoordinator!
  fileprivate var stackType: CoreDataStackType
  
  lazy var applicationDocumentsDirectory: URL = {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.makeschool.TripPlanner" in the application's documents Application Support directory.
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.count-1]
    }()
  
  init(stackType: CoreDataStackType) {
    self.stackType = stackType

    let modelURL = Bundle.main.url(forResource: "NetworkingCoreDataModel", withExtension: "momd")!
    let model = NSManagedObjectModel(contentsOf: modelURL)
    storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
    
    managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = storeCoordinator
    
    self.setupPersistentStore()
  }

  fileprivate func setupPersistentStore() {
    let failureReason = "There was an error creating or loading the application's saved data."
    do {
      switch (stackType) {
      case .inMemory:
        try storeCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
      case .sqLite:
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        try storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
      }
    } catch {
      // Report any error we got.
      var dict = [String: AnyObject]()
      dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
      dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
      
      dict[NSUnderlyingErrorKey] = error as NSError
      let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
      // Replace this with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
      abort()
    }
  }

  func save() {
    if !managedObjectContext.hasChanges {
      return
    }
    
    managedObjectContext.performAndWait { () -> Void in
    
      // catch-all clause necessary, due to bug in Swift 2. See: https://openradar.appspot.com/21669303
      do {
        try self.managedObjectContext.save()
      } catch let error as NSError {
        assertionFailure("Error saving context: \(error), \(error.userInfo)")
      } catch {
        assertionFailure("Undefined error")
      }
    }
  }
  
}
