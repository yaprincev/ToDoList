//
//  CoreDataServiceProtocol.swift
//  ToDoList
//
//  Created by student on 21.11.2024.
//

protocol CoreDataServiceProtocol {
    func fetchTasks() -> [ToDoModel]
    func saveTask(_ task: ToDoModel)
    func deleteTask(with id: Int)
    func updateTask(_ task: ToDoModel)
    func clearAllTasks()
}
