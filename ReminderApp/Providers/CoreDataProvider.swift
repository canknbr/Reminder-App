//
//  CoreDataProvider.swift
//  ReminderApp
//
//  Created by Can Kanbur on 29.05.2023.
//

import Foundation
import CoreData


class CoreDataProvider {
    static let shared = CoreDataProvider()
    let persistentContainer  : NSPersistentContainer
    private init(){
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
}
