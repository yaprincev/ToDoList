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
    private var indexPathToId: [Int: Int] = [:]
    
    // MARK: - Properties
    
    var onDoneStateChanged: Closure<(Int)>?
    var onDeleteContextDidTap: Closure<(Int)>?
    var onEditContextDidTap: Closure<(Int)>?
    
    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        super.init()
    }
    
    // MARK: - Methods
    
    func configure(with model: [ToDoModel]) {
        self.model = model
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
        indexPathToId[indexPath.row] = model[indexPath.row].id
        cell?.onDoneStateChanged = { [weak self] id in
            self?.lastChangedCell = cell
            self?.onDoneStateChanged?(id)
        }
        cell?.configure(with: model[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(actionProvider:  { suggestedActions in
            let redTitle = NSMutableAttributedString(string: "Удалить", attributes: [
                .foregroundColor: UIColor.red
            ])
            let editAction = UIAction(title: "Редактировать", image: UIImage(named: "edit")) { [weak self] action in
                self?.onEditContextDidTap?(self?.indexPathToId[indexPath.row] ?? 0)
            }
            let shareAction = UIAction(title: "Поделиться", image: UIImage(named: "export")) { action in
            }
            let deleteAction = UIAction(title: "", image: UIImage(named: "trash")) { [weak self] action in
                self?.onDeleteContextDidTap?(self?.indexPathToId[indexPath.row] ?? 0)
            }
            deleteAction.setValue(redTitle, forKey: "attributedTitle")
            return UIMenu(title: "", children: [editAction, shareAction, deleteAction])
        })
    }
}
