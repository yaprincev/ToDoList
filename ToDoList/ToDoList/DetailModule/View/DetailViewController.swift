//
//  DetailViewController.swift
//  ToDoList
//
//  Created by student on 15.11.2024.
//

import UIKit

final class DetailViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var placeholderLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - DetailViewOutput
    
    var output: DetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        configureAppearence()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        output?.userWillLeaveTheScreen(with: textView.text)
    }

}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {

    func configureDetailScreen(for task: ToDoModel) {
        dateLabel.text = task.date.configureDateForTasks()
        titleLabel.text = task.todo
        textView.text = task.description
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

}

// MARK: - Private methods

private extension DetailViewController {
    
    func configureAppearence() {
        view.backgroundColor = .black
        configureDate()
        configureTitle()
        configureTextView()
    }
    
    func configureTitle() {
        titleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        titleLabel.textColor = .white
    }
    
    func configureDate() {
        dateLabel.font = .systemFont(ofSize: 12, weight: .light)
        dateLabel.textColor = .white
    }
    
    func configureTextView() {
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.backgroundColor = .black
        placeholderLabel.text = "Введите описание..."
        placeholderLabel.textColor = .white
        placeholderLabel.font = .systemFont(ofSize: 16, weight: .light)
        textView.delegate = self
    }
    
}

extension DetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

}
