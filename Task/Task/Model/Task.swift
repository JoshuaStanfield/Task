//
//  Task.swift
//  Task
//
//  Created by Stanfield on 10/9/21.
//

import Foundation

class Task {
    
    let name: String
    let notes: String?
    let dueDate: Date?
    let isComplete: Bool
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
