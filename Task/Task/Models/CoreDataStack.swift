//
//  CoreDataStack.swift
//  Task
//
//  Created by Christopher Alegre on 9/25/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {

 static let container: NSPersistentContainer = {

     let taskApp = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
     let container = NSPersistentContainer(name: taskApp)
     container.loadPersistentStores() { (storeDescription, error) in
         if let error = error as NSError? {
             fatalError("Unresolved error \(error), \(error.userInfo)")
         }
     }
     return container
 }()

 static var context: NSManagedObjectContext { return container.viewContext }
}
