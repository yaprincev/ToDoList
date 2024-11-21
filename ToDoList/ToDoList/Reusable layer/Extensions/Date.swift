//
//  Date.swift
//  ToDoList
//
//  Created by student on 21.11.2024.
//

import Foundation

extension Date {
    
    func configureDateForTasks() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
    
}
