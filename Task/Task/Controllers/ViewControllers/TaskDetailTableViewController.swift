//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Christopher Alegre on 9/25/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    var dueDateValue: Date?

    @IBOutlet weak var nametextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        
        updateViews()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        navigationController?.popViewController(animated: true)
    }
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedViews(_ sender: UITapGestureRecognizer) {
        self.nametextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
    }
    
    private func updateTask() {
        guard let name = nametextField.text else {return}
        let dueDate = dueDateValue
        let note = notesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: note, due: dueDate)
        } else {
            TaskController.shared.add(taskWithName: name, notes: note, due: dueDate)
        }
    }
    
    private func updateViews() {
        guard let task = task else {return}
        
        title = task.name
        nametextField.text = task.name
        dueDateTextField.text = task.due?.stringValue()
        notesTextView.text = task.notes
        
    }
}
