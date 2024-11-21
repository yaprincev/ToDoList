//
//  DetailViewController.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class DetailViewController: UIViewController, ModuleTransitionable {
    
    // MARK: - DetailViewOutput
    
    var output: DetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
}
