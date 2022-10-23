//
//  Employee.swift
//  ShoutOut
//
//  Created by Obinna Aguwa on 23/10/2022.
//  Copyright © 2022 pluralsight. All rights reserved.
//

import Foundation
import CoreData

class Employee: NSManagedObject {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    
    @NSManaged var shoutOuts: NSSet?
}
