//
//  ToDoInteractor.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import Foundation

// MARK: - Interactor

final class ToDoInteractor {
    
    // MARK: - Private properties
    
    private var tasks: [ToDoModel] = []
    private let networkService: NetworkServiceProtocol?
    
    // MARK: - Initialization
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    // MARK:  - Properties
    
    weak var output: ToDoInteractorOutput?
    
}

// MARK: - ToDoInteractorInput

extension ToDoInteractor: ToDoInteractorInput {
    
    func getData() {
        getTasks()
    }
    
    func deleteTask(with id: Int) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks.remove(at: index)
        output?.didDeleteTask(newData: tasks)
    }
    
    func changeTaskDoneStatus(for id: Int) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks[index].completed.toggle()
        output?.didChangeDoneStatus(for: tasks[index])
    }
    
    func filterTasks(with query: String) {
        if query == "" {
            output?.didFilterTasks(filteredTasks: tasks)
            return
        }
        let filteredTasks = tasks.filter { task in
            task.todo.lowercased().contains(query.lowercased()) ||
            ((task.description?.lowercased().contains(query.lowercased())) != nil)
        }
        output?.didFilterTasks(filteredTasks: filteredTasks)
    }
    
    func addNewTask(task: String) {
        let newId = (tasks.map { $0.id }.max() ?? 0) + 1
        tasks.insert(ToDoModel(id: newId, todo: task), at: 0)
        output?.didAddNewTask(newData: tasks)
    }
    
    func editTask(with id: Int) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        output?.didFoundTaskForEdit(task: tasks[index])
    }

}

// MARK: - Private methods

private extension ToDoInteractor {
    
    func getTasks() {
        networkService?.getTasks(forURL: URLStorage.tasks.url, model: ToDoEntity.self) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let tasks):
                    self.tasks = tasks.todos.map { ToDoModel(entity: $0) }
                    self.output?.didGetTasks(tasks: self.tasks)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
