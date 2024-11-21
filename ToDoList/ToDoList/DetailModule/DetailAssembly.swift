//
//  DetailAssembly.swift
//  ToDoList
//
//  Created by student on 21.11.2024.
//

import UIKit

final class DetailAssembly {
    
    func assembly(with task: ToDoModel) -> UIViewController {
        let view = DetailViewController()
        let router = DetailRouter()
        let presenter = DetailPresenter(model: task)
        
        let coreDataService = CoreDataService()
        let interactor = DetailInteractor(coreDataService: coreDataService)
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        interactor.output = presenter
        view.output = presenter
        router.view = view
        return view
    }
    
}
