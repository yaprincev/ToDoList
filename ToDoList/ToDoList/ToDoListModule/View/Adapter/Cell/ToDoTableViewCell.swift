//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by student on 16.11.2024.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var detailInformation: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Private properties
    
    private var model: ToDoEntity?
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
    
    // MARK: - Methods
    
    func configure(with model: ToDoEntity) {
        title.text = model.title
        detailInformation.text = model.description
        date.text = model.date.formatted()
        configureCellState(isDone: model.isDone)
    }

}

// MARK: - Private methods

private extension ToDoTableViewCell {
 
    func configureAppearence() {
        configureTitle()
        configureDetailInformation()
        configureDate()
        backgroundColor = .black
    }
    
    func configureTitle() {
        title.numberOfLines = 1
        title.textColor = .white
    }
    
    func configureDetailInformation() {
        detailInformation.numberOfLines = 2
        detailInformation.textColor = .white
    }
    
    func configureDate() {
        date.font = .systemFont(ofSize: 12, weight: .light)
        date.numberOfLines = 1
        date.textColor = .white
    }
    
    func configureCellState(isDone: Bool) {
        if isDone {
            doneButton.setImage(UIImage(named: "filledCircle"), for: .normal)
            detailInformation.font = .systemFont(ofSize: 12, weight: .light)
            title.font = .systemFont(ofSize: 16, weight: .light)
            title.attributedText = title.text?.withStrikeTrough()
        } else {
            doneButton.setImage(UIImage(named: "circle"), for: .normal)
            detailInformation.font = .systemFont(ofSize: 12, weight: .medium)
            title.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    
}
