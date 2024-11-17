//
//  ToDoInteractor.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import Foundation

// MARK: - Interactor

final class ToDoInteractor {
    
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
    }
    
}
