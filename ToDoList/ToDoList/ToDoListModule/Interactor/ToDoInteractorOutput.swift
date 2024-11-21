//
//  ToDoInteractorOutput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol ToDoInteractorOutput: AnyObject {
    func didGetTasks(tasks: [ToDoModel])
    func didChangeDoneStatus(for: ToDoModel)
    func didFilterTasks(filteredTasks: [ToDoModel])
    func didAddNewTask(newData: [ToDoModel])
    func didDeleteTask(newData: [ToDoModel])
    func didFoundTaskForEdit(task: ToDoModel)
}
