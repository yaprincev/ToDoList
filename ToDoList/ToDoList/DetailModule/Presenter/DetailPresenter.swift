//
//  DetailPresenter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

// MARK: - Presenter

final class DetailPresenter {
    
    // MARK:  - Properties
    
    weak var view: DetailViewInput?
    var router: DetailRouterInput?
    
    // MARK: - DetailPresenterOutput
    
    var output: DetailPresenterOutput?

}

// MARK: - DetailPresenterInput

extension DetailPresenter: DetailPresenterInput {
}

//  MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
}
