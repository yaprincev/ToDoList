//
//  ToDoPresenterTests.swift
//  ToDoListTests
//
//  Created by student on 21.11.2024.
//

import XCTest
@testable import ToDoList
 
final class ToDoPresenterTests: XCTestCase {
    
    private var presenter: ToDoPresenter!
    private var mockView: MockToDoViewInput!
    private var mockRouter: MockToDoRouterInput!
    private var mockInteractor: MockToDoInteractorInput!
    
    override func setUp() {
        super.setUp()
        presenter = ToDoPresenter()
        mockView = MockToDoViewInput()
        mockRouter = MockToDoRouterInput()
        mockInteractor = MockToDoInteractorInput()
        
        presenter.view = mockView
        presenter.router = mockRouter
        presenter.interactor = mockInteractor
    }
    
    func testViewDidLoad() {
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockInteractor.getDataCalled)
    }
    
    func testChangeTaskDoneStatus() {
        // Given
        let testId = 1
        
        // When
        presenter.changeTaskDoneStatus(for: testId)
        
        // Then
        XCTAssertEqual(mockInteractor.changedTaskId, testId)
    }
    
    func testSearchTasks() {
        // Given
        let query = "Test Query"
        
        // When
        presenter.searchTasks(with: query)
        
        // Then
        XCTAssertEqual(mockInteractor.searchQuery, query)
    }
    
    func testUserWantsAddNewTask() {
        // When
        presenter.userWantsAddNewTask()
        
        // Then
        XCTAssertTrue(mockView.alertDisplayed)
    }
    
    func testDidEnterText() {
        // Given
        let taskText = "New Task"
        
        // When
        presenter.didEnterText(text: taskText)
        
        // Then
        XCTAssertEqual(mockInteractor.addedTaskText, taskText)
    }
    
    func testUserWantsDeleteTask() {
        // Given
        let taskId = 2
        
        // When
        presenter.userWantsDeleteTask(with: taskId)
        
        // Then
        XCTAssertEqual(mockInteractor.deletedTaskId, taskId)
    }
    
    func testUserWantsEditTask() {
        // Given
        let taskId = 3
        
        // When
        presenter.userWantsEditTask(with: taskId)
        
        // Then
        XCTAssertEqual(mockInteractor.editedTaskId, taskId)
    }
}
 
// MARK: - Mock Classes
 
final class MockToDoViewInput: ToDoViewInput {
    var alertDisplayed = false
    func displayTasks(with tasks: [ToDoModel]) {}
    func updateDoneStatus(for model: ToDoModel) {}
    func showAlert(title: String, message: String) { alertDisplayed = true }
}
 
final class MockToDoRouterInput: ToDoRouterInput {
    func openDetailScreen(with task: ToDoModel) {}
}
 
final class MockToDoInteractorInput: ToDoInteractorInput {
    var getDataCalled = false
    var changedTaskId: Int?
    var searchQuery: String?
    var addedTaskText: String?
    var deletedTaskId: Int?
    var editedTaskId: Int?
    
    func getData() { getDataCalled = true }
    func changeTaskDoneStatus(for id: Int) { changedTaskId = id }
    func filterTasks(with query: String) { searchQuery = query }
    func addNewTask(task: String) { addedTaskText = task }
    func deleteTask(with id: Int) { deletedTaskId = id }
    func editTask(with id: Int) { editedTaskId = id }
}
 
