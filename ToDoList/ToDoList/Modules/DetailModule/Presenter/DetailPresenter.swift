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
    
    private var model: ToDoModel?
    
    // MARK: - Initialization
    
    init(model: ToDoModel) {
        self.model = model
    }

}

//  MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    
    func viewDidLoad() {
        guard let model else {
            return
        }
        view?.configureDetailScreen(for: model)
    }
    
    func userWillLeaveTheScreen(with description: String) {
        if model?.description != description {
            model?.description = description
            if let model {
                interactor?.updateData(model: model)
            }
        }
    }
    
}

// MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {
}
