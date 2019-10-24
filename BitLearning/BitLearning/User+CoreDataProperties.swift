//
//  User+CoreDataProperties.swift
//  BitLearning
//
//  Created by Aluno Mack on 24/10/2019.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var saldoReais: Int16
    @NSManaged public var listaCotacao: [[String:Int]]

}
