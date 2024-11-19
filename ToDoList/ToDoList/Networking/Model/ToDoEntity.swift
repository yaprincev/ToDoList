//
//  ToDoEntity.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

struct ToDoEntity: Codable {
    let todos: [ToDo]
}

struct ToDo: Codable {
    let id: Int?
    let todo: String?
    let completed: Bool?
    let userID: Int?
}
