//
//  ToDoAdapter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoAdapter: NSObject {

    // MARK: - Private Properties

    private var model: [ToDoEntity]?
    private let tableView: UITableView
    
    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - Methods
    
    func configure(with model: [ToDoEntity]) {
        self.model = model
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        tableView.reloadData()
    }

}

extension ToDoAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoTableViewCell
        cell?.configure(with: model[indexPath.row])
        return cell ?? UITableViewCell()
        
    }
    
    
    
    
}
