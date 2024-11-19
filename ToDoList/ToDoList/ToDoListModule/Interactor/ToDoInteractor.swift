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
    
    private var data: [ToDoEntity]?
    
    // MARK:  - Properties
    
    weak var output: ToDoInteractorOutput?
    
}

// MARK: - ToDoInteractorInput

extension ToDoInteractor: ToDoInteractorInput {
    
    func configureMockData() {
        var mockData = [ToDoEntity]()
        mockData.append(ToDoEntity(title: "Почитать книгу", description: "Составить список необходимых продуктов для ужина. Не забыть проверить, что уже есть в холодильнике и в шкафу", date: Date(), isDone: true, id: 1))
        mockData.append(ToDoEntity(title: "Уборка в квартире", description: "Провести генеральную уборку в квартире", date: Date(), isDone: false, id: 2))
        mockData.append(ToDoEntity(title: "Заняться спортом", description: "Сходить в спортзал или сделать тренировку дома. Не забыть про разминку и растяжку", date: Date(), isDone: false, id: 3))
        output?.didCreateMockData(mockData: mockData)
        data = mockData
    }
    
    func changeTaskDoneStatus(for id: Int) {
        guard let index = data?.firstIndex(where: { $0.id == id }) else {
            return
        }
        data?[index].isDone.toggle()
        if let data {
            output?.didChangeDoneStatus(for: data[index])
        }
    }
    
    func filterTasks(with query: String) {
        guard let data else {
            return
        }
        if query == "" {
            output?.didFilterTasks(filteredTasks: data)
            return
        }
        let filteredTasks = data.filter { task in
            task.title.lowercased().contains(query.lowercased()) ||
            task.description.lowercased().contains(query.lowercased())
        }
        output?.didFilterTasks(filteredTasks: filteredTasks)
    }
    
    func addNewTask(task: String) {
        let newId = (data?.map { $0.id }.max() ?? 0) + 1
        data?.insert(ToDoEntity(title: task, description: "", date: Date(), isDone: false, id: newId), at: 0)
        if let data {
            output?.didAddNewTask(newData: data)
        }
    }

}
