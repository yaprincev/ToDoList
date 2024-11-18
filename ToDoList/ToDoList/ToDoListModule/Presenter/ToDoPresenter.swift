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
    
    func changeTaskDoneStatus(for id: Int) {
        interactor?.changeTaskDoneStatus(for: id)
    }
    
    func searchTasks(with query: String) {
        interactor?.filterTasks(with: query)
    }

}

// MARK: - DetailPresenterOutput

extension ToDoPresenter: DetailPresenterOutput {
}

// MARK: - ToDoInteractorOutput

extension ToDoPresenter: ToDoInteractorOutput {
    
    func didCreateMockData(mockData: [ToDoEntity]) {
        view?.displayTasks(with: mockData)
    }
    
    func didChangeDoneStatus(for model: ToDoEntity) {
        view?.updateDoneStatus(for: model)
    }
    
    func didFilterTasks(filteredTasks: [ToDoEntity]) {
        view?.displayTasks(with: filteredTasks)
    }
    
}

