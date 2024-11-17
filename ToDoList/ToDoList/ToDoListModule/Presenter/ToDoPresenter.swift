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

    func viewDidLoad() {
        interactor?.configureMockData()
    }

}

// MARK: - DetailPresenterOutput

extension ToDoPresenter: DetailPresenterOutput {
}

// MARK: - ToDoInteractorOutput

extension ToDoPresenter: ToDoInteractorOutput {
    
    func didCreateMockData(mockData: [ToDoEntity]) {
        view?.setupInitialState(model: mockData)
    }
    
}

