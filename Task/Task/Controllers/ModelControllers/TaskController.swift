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
    static var shared = TaskController()
    var tasks: [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
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
        do {
       try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistantStore()
    }
    
}
