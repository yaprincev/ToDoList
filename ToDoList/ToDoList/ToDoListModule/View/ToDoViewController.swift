//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoViewController: UIViewController {

    // MARK: - ToDoViewOutput
    
    var output: ToDoViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - ToDoViewInput

extension ToDoViewController: ToDoViewInput {
}
