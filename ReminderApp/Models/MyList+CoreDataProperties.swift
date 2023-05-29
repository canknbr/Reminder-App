//
//  MyList+CoreDataProperties.swift
//  ReminderApp
//
//  Created by Can Kanbur on 29.05.2023.
//

import CoreData
import Foundation
import UIKit

extension MyList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var name: String
    @NSManaged public var color: UIColor
}

extension MyList: Identifiable {
}

extension MyList {
}
