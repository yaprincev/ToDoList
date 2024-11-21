//
//  DetailInteractor.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import Foundation

// MARK: - Interactor

final class DetailInteractor {
    
    // MARK: - Properties

    weak var output: DetailInteractorOutput?
    
    // MARK: - Private properties
    
    private let coreDataService: CoreDataServiceProtocol
    
    // MARK: - Initialization
    
    init(coreDataService: CoreDataServiceProtocol) {
        self.coreDataService = coreDataService
    }
    
}

// MARK: - ToDoInteractorInput

extension DetailInteractor: DetailInteractorInput {
    
    func updateData(model: ToDoModel) {
        coreDataService.updateTask(model)
        NotificationCenter.default.post(name: .taskDidUpdate, object: nil, userInfo: ["task" : model])
    }

}

