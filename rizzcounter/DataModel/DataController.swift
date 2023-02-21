//
//  DataController.swift
//  rizzcounter
//
//  Created by Bernice Arreola on 2/20/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RizzModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!! WUHU!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addRizz(name: String, points: Double, context: NSManagedObjectContext) {
        let rizz = Rizz(context: context)
        rizz.id = UUID()
        rizz.date = Date()
        rizz.name = name
        rizz.points = points
        
        save(context: context)
    }
    
    func editRizz(rizz: Rizz, name: String, points: Double, context: NSManagedObjectContext) {
        rizz.date = Date()
        rizz.name = name
        rizz.points = points
        
        save(context:context)
    }
}
