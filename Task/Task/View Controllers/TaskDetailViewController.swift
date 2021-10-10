//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Stanfield on 10/8/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    // MARK: - Properties
    var tasks: Task?
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
    }
}
