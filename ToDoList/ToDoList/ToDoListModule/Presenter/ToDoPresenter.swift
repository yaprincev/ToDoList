//
//  ToDoPresenter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

// MARK: - Presenter

final class ToDoPresenter {
    
    // MARK: - Properties
    
    weak var view: ToDoViewInput?
    var router: ToDoRouterInput?
    var interactor: ToDoInteractorInput?
    
}

// MARK: - ToDoViewOutput

extension ToDoPresenter: ToDoViewOutput {
}

// MARK: - DetailPresenterOutput

extension ToDoPresenter: DetailPresenterOutput {
    
    func viewDidLoad() {
        interactor?.configureMockData()
    }
    
}

extension ToDoPresenter: ToDoInteractorOutput {
    
    func didCreateMockData(mockData: [ToDoEntity]) {
        view?.setupInitialState(model: mockData)
    }
    
}

