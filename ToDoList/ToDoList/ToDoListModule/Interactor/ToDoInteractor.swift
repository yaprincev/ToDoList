//
//  ToDoInteractor.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

// MARK: - Interactor

final class ToDoInteractor {
    
    // MARK:  - Properties
    
    weak var output: ToDoInteractorOutput?
    
}

// MARK: - ToDoInteractorInput

extension ToDoInteractor: ToDoInteractorInput {
}
