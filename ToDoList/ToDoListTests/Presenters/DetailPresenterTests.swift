//
//  DetailPresenterTests.swift
//  ToDoListTests
//
//  Created by student on 21.11.2024.
//

import XCTest
@testable import ToDoList

final class DetailPresenterTests: XCTestCase {
    
    private var presenter: DetailPresenter!
    private var mockView: MockDetailViewInput!
    private var mockInteractor: MockDetailInteractorInput!
    
    override func setUp() {
        super.setUp()
        let testModel = ToDoModel(id: 1, todo: "Do")
        presenter = DetailPresenter(model: testModel)
        mockView = MockDetailViewInput()
        mockInteractor = MockDetailInteractorInput()
        presenter.view = mockView
        presenter.interactor = mockInteractor
    }
    
    func testViewDidLoad() {
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.configureCalled)
    }
    
    func testUserWillLeaveTheScreen_withUpdatedDescription() {
        // Given
        let updatedDescription = "Updated Description"
        
        // When
        presenter.userWillLeaveTheScreen(with: updatedDescription)
        
        // Then
        XCTAssertEqual(mockInteractor.updatedModel?.description, updatedDescription)
    }
}
 
// Mock Classes
final class MockDetailViewInput: DetailViewInput {
    var configureCalled = false
    func configureDetailScreen(for model: ToDoModel) {
        configureCalled = true
    }
}
 
final class MockDetailInteractorInput: DetailInteractorInput {
    var updatedModel: ToDoModel?
    func updateData(model: ToDoModel) { updatedModel = model }
}
 
