//
//  ToDoAdapter.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoAdapter: NSObject {

    // MARK: - Private Properties

    private var model: [ToDoModel]?
    private let tableView: UITableView
    private var lastChangedCell: ToDoTableViewCell?
    
    // MARK: - Properties
    
    var onDoneStateChanged: Closure<(Int)>?
    
    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - Methods
    
    func configure(with model: [ToDoModel]) {
        self.model = model
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        tableView.reloadData()
    }
    
    func updateCellDoneState(for model: ToDoModel) {
        lastChangedCell?.configure(with: model)
    }

}

extension ToDoAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoTableViewCell
        cell?.onDoneStateChanged = { [weak self] id in
            self?.lastChangedCell = cell
            self?.onDoneStateChanged?(id)
        }
        cell?.configure(with: model[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}
