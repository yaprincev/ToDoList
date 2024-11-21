//
//  ToDoRouter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

// MARK: - Router

final class ToDoRouter: ToDoRouterInput {
    
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - ToDoRouterInput
    
    func openDetailScreen(with task: ToDoModel) {
        let detailModule = DetailAssembly().assembly(with: task)
        view?.push(module: detailModule, animated: true)
    }
    
}
