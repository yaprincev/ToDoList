//
//  DetailViewInput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol DetailViewInput: AnyObject {
    func configureDetailScreen(for: ToDoModel)
}
