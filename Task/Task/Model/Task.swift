//
//  Task.swift
//  Task
//
//  Created by Stanfield on 10/9/21.
//

import Foundation

class Task: Codable {
    
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}

extension Task: Equatable {}

func ==(lhs: Task, rhs: Task) -> Bool {
    if lhs.name != rhs.name { return false }
    if lhs.notes != rhs.notes { return false }
    if lhs.dueDate != rhs.dueDate { return false }
    if lhs.isComplete != rhs.isComplete { return false }
    
    return true
}
