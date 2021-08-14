//
//  Presistence.swift
//  NewsApp
//
//  Created by Amr Ahmed on 14/08/2021.
//

import Foundation
import CoreData

struct PresistenceController{
    
    static let shared = PresistenceController()
    
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "News")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error : \(error)")
            }
        }
    }
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    
}
