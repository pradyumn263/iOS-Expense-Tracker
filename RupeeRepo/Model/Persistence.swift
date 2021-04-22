//
//  Persistence.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 21/04/21.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init ()
    {
        container = NSPersistentContainer(name: "TransactionLog")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved Error: \(error)")
            }
        }
    }
}
