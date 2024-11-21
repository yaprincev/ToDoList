//
//  DetailViewOutput.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
    func userWillLeaveTheScreen(with: String)
}
