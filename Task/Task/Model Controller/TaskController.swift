//
//  TaskController.swift
//  Task
//
//  Created by Stanfield on 10/9/21.
//

import Foundation

class TaskController {
    
    // MARK: - Shared Instance
    static let shared = TaskController()
    
    // MARK: - SOT
    var tasks: [Task] = []
    
    // MARK: - CRUD Functions
    ///Create a task, add it to the SOT, and save the changes.
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(task)
        saveToPersistenceStore()
    }
    
    ///Update a task.
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        saveToPersistenceStore()
    }
    
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        saveToPersistenceStore()
    }
    
    ///Delete a task.
    func delete(task: Task) {
        guard let taskToDelete = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: taskToDelete)
        saveToPersistenceStore()
    }
    
    // MARK: - Persistence
    
    //fileURL
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Task.json")
        return fileURL
    }
    
    // Save
    func saveToPersistenceStore() {
        
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    // Load
    func loadFromPersistanceStore() {
        do{
            let data = try Data(contentsOf: fileURL())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
