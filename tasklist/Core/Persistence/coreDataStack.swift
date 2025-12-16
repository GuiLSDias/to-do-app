//
//  coreDataStack.swift
//  tasklist
//
//  Created by Guilherme Dias on 16/12/25.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()
    
    let container: NSPersistentContainer
    
    private init(){
        container = NSPersistentContainer(name: "TaskListModel")
        container.loadPersistentStores{_, error in if let error {fatalError("CoreData error: \(error)")}}
    }
    var context: NSManagedObjectContext {
        container.viewContext
    }
    func save(){
        guard context.hasChanges else {return}
        try? context.save()
    }
}
