//
//  Prompts+CoreDataProperties.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import Foundation
import CoreData


extension Prompts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prompts> {
        return NSFetchRequest<Prompts>(entityName: "Prompts")
    }

    @NSManaged public var prompt: String?
    @NSManaged public var topic: String?
    @NSManaged public var discussion: NSSet?

}

// MARK: Generated accessors for discussion
extension Prompts {

    @objc(addDiscussionObject:)
    @NSManaged public func addToDiscussion(_ value: Discussion)

    @objc(removeDiscussionObject:)
    @NSManaged public func removeFromDiscussion(_ value: Discussion)

    @objc(addDiscussion:)
    @NSManaged public func addToDiscussion(_ values: NSSet)

    @objc(removeDiscussion:)
    @NSManaged public func removeFromDiscussion(_ values: NSSet)

}

extension Prompts : Identifiable {

}
