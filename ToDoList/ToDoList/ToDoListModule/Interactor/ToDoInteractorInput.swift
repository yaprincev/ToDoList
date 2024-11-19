//
//  ToDoInteractorInput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol ToDoInteractorInput: AnyObject {
    func getData()
    func changeTaskDoneStatus(for: Int)
    func filterTasks(with: String)
    func addNewTask(task: String)
}
