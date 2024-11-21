//
//  ToDoListAssembly.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoListAssembly {
    
    func assembly() -> UIViewController {
        let view = ToDoViewController()
        let router = ToDoRouter()
        let presenter = ToDoPresenter()
        
        let networkService = NetworkService()
        let coreDataService = CoreDataService()
        let interactor = ToDoInteractor(networkService: networkService, coreDataService: coreDataService)
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        interactor.output = presenter
        view.output = presenter
        router.view = view
        return view
    }
    
}
