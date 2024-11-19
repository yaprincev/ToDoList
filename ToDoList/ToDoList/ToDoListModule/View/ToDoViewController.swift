//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class ToDoViewController: UIViewController, ModuleTransitionable {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var sumLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var addItemButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Private properties
    
    private lazy var adapter = ToDoAdapter(tableView: tableView)
    
    // MARK: - ToDoViewOutput
    
    var output: ToDoViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        configureAppearence()
        output?.viewDidLoad()
        super.viewDidLoad()
    }

    @IBAction func onNewTaskPressed(_ sender: Any) {
        output?.userWantAddNewTask()
    }
    
}

// MARK: - ToDoViewInput

extension ToDoViewController: ToDoViewInput {
    
    func displayTasks(with model: [ToDoEntity]) {
        adapter.configure(with: model)
        sumLabel.text = String(model.count) + " " + model.count.pluralized(forms: ("Задача", "Задачи", "Задач"))
    }
    
    func updateDoneStatus(for model: ToDoEntity) {
        adapter.updateCellDoneState(for: model)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Название задачи"
        }
        let okAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else {
                return
            }
            self?.output?.didEnterText(text: text)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - Private methods

private extension ToDoViewController {
    
    func configureAppearence() {
        view.backgroundColor = .black
        configureSearchBar()
        configureTitle()
        configureAdapter()
        configureBottomView()
        configureAddItemButton()
        configureSumLabel()
    }
    
    func configureTitle() {
        titleLabel.text = "Задачи"
        titleLabel.font = .systemFont(ofSize: 34, weight: UIFont.Weight(700))
        titleLabel.textColor = .white
    }
    
    func configureAdapter() {
        tableView.dataSource = adapter
        adapter.onDoneStateChanged = { [weak self] id in
            self?.output?.changeTaskDoneStatus(for: id)
        }
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 41/255, alpha: 1.0)
            let placeholderText = "Search"
            let placeholderColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [.foregroundColor: placeholderColor])
            
            if let searchIconView = textField.leftView as? UIImageView {
                searchIconView.tintColor = placeholderColor
            }
        }
    }
    
    func configureBottomView() {
        bottomView.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 41/255, alpha: 1.0)
    }
    
    func configureAddItemButton() {
        addItemButton.setImage(UIImage(named: "addNewItem"), for: .normal)
    }
    
    func configureSumLabel() {
        sumLabel.font = .systemFont(ofSize: 11, weight: .medium)
        sumLabel.textColor = .white
    }
    
}

// MARK: - UISearchBarDelegate

extension ToDoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output?.searchTasks(with: searchText)
    }
    
}
