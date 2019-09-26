//
//  TaskController.swift
//  Task
//
//  Created by Christopher Alegre on 9/25/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    var fetchResultsController: NSFetchedResultsController<Task>
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let isComplete = NSSortDescriptor(key: "isComplete", ascending: true)
        let timeSort = NSSortDescriptor(key: "due", ascending: false)
        fetchRequest.sortDescriptors = [isComplete, timeSort]
        
        let bigDaddyController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        fetchResultsController = bigDaddyController
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func add(taskWithName name: String, notes:String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        saveToPersistantStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistantStore()
    }
    
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistantStore()
    }
    
    func saveToPersistantStore() {
        if CoreDataStack.context.hasChanges {
            try? CoreDataStack.context.save()
        }
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistantStore()
    }
    
}
