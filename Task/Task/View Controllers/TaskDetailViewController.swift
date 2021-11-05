//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Stanfield on 10/8/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    // MARK: - Properties
    var task: Task?
    var date: Date?
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text,
              !name.isEmpty,
              let notes = taskNotesTextView.text,
              !notes.isEmpty else { return }
        if let task = task {
            TaskController.shared.update(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.shared.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
        self.date = task.dueDate //Starts the screen off with the due date on the task already.
    }
}
