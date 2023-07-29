//
//  Discussion+CoreDataProperties.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
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
