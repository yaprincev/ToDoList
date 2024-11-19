//
//  URLStorage.swift
//  ToDoList
//
//  Created by student on 19.11.2024.
//

import Foundation

enum URLStorage {
    case tasks
    var url: URL? {
        switch self {
        case .tasks:
            return URL(string: "https://dummyjson.com/todos")
        }
    }
}
