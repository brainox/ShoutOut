//
//  CoreDataStack.swift
//  ShoutOut
//
//  Created by Obinna Aguwa on 22/10/2022.
//  Copyright © 2022 pluralsight. All rights reserved.
//

import Foundation
import CoreData

func createMainContext() -> NSManagedObjectContext {
    // Initialize NSManagedObjectModel
    let modelUrl = Bundle.main.url(forResource: "ShoutOut", withExtension: "momd")
    guard let model = NSManagedObjectModel(contentsOf: modelUrl!) else { fatalError("Model Not Found")}
    
    // Configure NSPersistentStoreCoordinator with an NSPersistentStore
    let persistentStore = NSPersistentStoreCoordinator(managedObjectModel: model)
    
    let storeUrl = URL.documentsURL.appendingPathComponent("ShoutOut.sqlite")
    
    // TODO: Use Migrations
    try! FileManager.default.removeItem(at: storeUrl)
    
    try! persistentStore.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl)
    
    
    
    // Create and return NSManagedObjectContext
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = persistentStore
    
    return context
}

extension URL {
    static var documentsURL: URL {
        return try! FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
}

protocol ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext! { get set }
}
