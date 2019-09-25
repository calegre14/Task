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
    var tasks: [Task] = []
    
    func add(taskWithName name: String, notes:String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistantStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        return tasks
    }
    
}
