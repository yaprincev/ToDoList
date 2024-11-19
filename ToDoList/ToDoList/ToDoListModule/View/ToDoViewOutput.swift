//
//  ToDoViewOutput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol ToDoViewOutput: AnyObject {
    func viewDidLoad()
    func changeTaskDoneStatus(for: Int)
    func searchTasks(with: String)
    func userWantAddNewTask()
    func didEnterText(text: String)
}

