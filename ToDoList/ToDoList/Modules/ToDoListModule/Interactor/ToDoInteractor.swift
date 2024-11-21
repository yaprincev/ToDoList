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
    private let networkService: NetworkServiceProtocol
    private let coreDataService: CoreDataServiceProtocol
    
    // MARK: - Initialization
    
    init(networkService: NetworkServiceProtocol, coreDataService: CoreDataServiceProtocol) {
        self.networkService = networkService
        self.coreDataService = coreDataService
        NotificationCenter.default.addObserver(self, selector: #selector(taskDidUpdate(_:)), name: .taskDidUpdate, object: nil)
    }
    
    // MARK:  - Properties
    
    weak var output: ToDoInteractorOutput?
    
}

// MARK: - ToDoInteractorInput

extension ToDoInteractor: ToDoInteractorInput {
    
    func getData() {
        tasks = coreDataService.fetchTasks()
        if tasks.isEmpty {
            getTasksFromNetwork()
        } else {
            output?.didGetTasks(tasks: tasks)
        }
    }
    
    func deleteTask(with id: Int) {
        coreDataService.deleteTask(with: id)
        tasks.removeAll { $0.id == id }
        output?.didDeleteTask(newData: tasks)
    }
    
    func changeTaskDoneStatus(for id: Int) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks[index].completed.toggle()
        coreDataService.updateTask(tasks[index])
        output?.didChangeDoneStatus(for: tasks[index])
    }
    
    func filterTasks(with query: String) {
        if query.isEmpty {
            output?.didFilterTasks(filteredTasks: tasks)
            return
        }
        let filteredTasks = tasks.filter { task in
            task.todo.lowercased().contains(query.lowercased()) ||
            (task.description?.lowercased().contains(query.lowercased()) ?? false)
        }
        output?.didFilterTasks(filteredTasks: filteredTasks)
    }
    
    func addNewTask(task: String) {
        let newId = (tasks.map { $0.id }.max() ?? 0) + 1
        let newTask = ToDoModel(id: newId, todo: task)
        tasks.insert(newTask, at: 0)
        coreDataService.saveTask(newTask)
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
    
    func getTasksFromNetwork() {
        networkService.getTasks(forURL: URLStorage.tasks.url, model: ToDoEntity.self) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let tasks):
                    self.tasks = tasks.todos.map { ToDoModel(entity: $0) }
                    self.tasks.forEach { self.coreDataService.saveTask($0) }
                    self.output?.didGetTasks(tasks: self.tasks)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @objc func taskDidUpdate(_ notification: Notification) {
        guard let updatedTask = notification.userInfo?["task"] as? ToDoModel else {
            return
        }
        if let index = tasks.firstIndex(where: { $0.id == updatedTask.id }) {
            tasks[index] = updatedTask
            output?.didUpdateTask(newData: tasks)
        }
    }
    
}
