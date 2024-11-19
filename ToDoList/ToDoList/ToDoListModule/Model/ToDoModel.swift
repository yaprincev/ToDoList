//
//  ToDoModel.swift
//  ToDoList
//
//  Created by student on 19.11.2024.
//

import Foundation

struct ToDoModel {
    let id: Int
    let todo: String
    var completed: Bool
    var description: String?
    let date: Date

    init(entity: ToDo) {
        self.id = entity.id ?? 0
        self.todo = entity.todo ?? ""
        self.completed = entity.completed ?? false
        self.date = Date()
    }
    
    init(id: Int, todo: String) {
        self.id = id
        self.todo = todo
        self.completed = false
        self.date = Date()
    }

}
