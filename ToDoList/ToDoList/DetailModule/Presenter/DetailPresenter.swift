//
//  DetailPresenter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

// MARK: - Presenter

final class DetailPresenter {
    
    // MARK: - Properties
    
    weak var view: DetailViewInput?
    var router: DetailRouterInput?
    var interactor: DetailInteractorInput?
    
    // MARK: - Private properties
    
    private let model: ToDoModel?
    
    // MARK: - Initialization
    
    init(model: ToDoModel) {
        self.model = model
    }

}

//  MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
}

extension DetailPresenter: DetailInteractorOutput {
}
