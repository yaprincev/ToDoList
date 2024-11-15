//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoViewController: UIViewController {

    // MARK: - View output
    
    var output: ToDoViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - View input

extension ToDoViewController: ToDoViewInput {
}
