//
//  ToDoInteractorOutput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol ToDoInteractorOutput: AnyObject {
    func didCreateMockData(mockData: [ToDoEntity])
    func didChangeDoneStatus(for: ToDoEntity)
}
