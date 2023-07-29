//
//  Discussion+CoreDataProperties.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import Foundation
import CoreData


extension Discussion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Discussion> {
        return NSFetchRequest<Discussion>(entityName: "Discussion")
    }

    @NSManaged public var date: Date?
    @NSManaged public var response: String?
    @NSManaged public var prompts: Prompts?

}

extension Discussion : Identifiable {

}
