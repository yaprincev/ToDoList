//
//  ToDoViewInput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol ToDoViewInput: AnyObject {
    func displayTasks(with: [ToDoEntity])
    func updateDoneStatus(for: ToDoEntity)
}
