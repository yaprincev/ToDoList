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
        interactor?.getData()
    }
    
    func changeTaskDoneStatus(for id: Int) {
        interactor?.changeTaskDoneStatus(for: id)
    }
    
    func searchTasks(with query: String) {
        interactor?.filterTasks(with: query)
    }
    
    func userWantAddNewTask() {
        view?.showAlert(title: "Добавить новую задачу", message: "Введите название задачи")
    }
    
    func didEnterText(text: String) {
        interactor?.addNewTask(task: text)
    }

}

// MARK: - DetailPresenterOutput

extension ToDoPresenter: DetailPresenterOutput {
}

// MARK: - ToDoInteractorOutput

extension ToDoPresenter: ToDoInteractorOutput {
    
    func didGetTasks(tasks: [ToDoModel]) {
        view?.displayTasks(with: tasks)
    }
    
    func didChangeDoneStatus(for model: ToDoModel) {
        view?.updateDoneStatus(for: model)
    }
    
    func didFilterTasks(filteredTasks: [ToDoModel]) {
        view?.displayTasks(with: filteredTasks)
    }
    
    func didAddNewTask(newData: [ToDoModel]) {
        view?.displayTasks(with: newData)
    }
    
}

