// Photos+CoreDataProperties.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

///
public extension Photos {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Photos> {
        NSFetchRequest<Photos>(entityName: "Photos")
    }

    @NSManaged var image: String?
}

extension Photos: Identifiable {}
