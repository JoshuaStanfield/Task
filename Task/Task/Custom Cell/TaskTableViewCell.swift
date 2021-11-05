//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Josh Stanfield on 10/14/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
            taskNameLabel.text = task.name
            
            if task.isComplete {
                completionButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
            } else {
                completionButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}
