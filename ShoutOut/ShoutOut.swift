//
//  Shout.swift
//  ShoutOut
//
//  Created by Obinna Aguwa on 23/10/2022.
//  Copyright © 2022 pluralsight. All rights reserved.
//

import Foundation
import CoreData

class ShoutOut: NSManagedObject {
    @NSManaged var from: String?
    @NSManaged var message: String?
    @NSManaged var sentDate: Date?
    @NSManaged var shoutCategory: String
    
    @NSManaged var toEmployee: Employee
}
