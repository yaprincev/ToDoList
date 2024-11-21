//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by student on 16.11.2024.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var strikedTitle: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var detailInformation: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Properties
    
    var onDoneStateChanged: Closure<(Int)>?
    
    // MARK: - Private properties
    
    private var model: ToDoModel?
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
    
    // MARK: - Methods
    
    func configure(with model: ToDoModel) {
        self.model = model
        title.text = model.todo
        strikedTitle.text = model.todo
        detailInformation.text = model.description
        configureDate(with: model.date)
        configureCellState(isDone: model.completed)
    }

}

// MARK: - Private methods

private extension ToDoTableViewCell {
 
    func configureAppearence() {
        configureTitle()
        configureDetailInformation()
        configureTapHandler()
        configureStrikedTitle()
        selectionStyle = .none
        backgroundColor = .black
    }
    
    func configureTitle() {
        title.numberOfLines = 1
        title.textColor = .white
        title.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    func configureStrikedTitle() {
        strikedTitle.numberOfLines = 1
        strikedTitle.textColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        strikedTitle.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    func configureDetailInformation() {
        detailInformation.numberOfLines = 2
        detailInformation.textColor = .white
    }
    
    func configureDate(with dateText: Date) {
        date.font = .systemFont(ofSize: 12, weight: .light)
        date.numberOfLines = 1
        date.textColor = .white
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        date.text = formatter.string(from: dateText)
    }
    
    func configureCellState(isDone: Bool) {
        if isDone {
            doneButton.setImage(UIImage(named: "filledCircle"), for: .normal)
            detailInformation.font = .systemFont(ofSize: 12, weight: .light)
            strikedTitle.attributedText = strikedTitle.text?.withStrikeTrough()
            strikedTitle.isHidden = false
            title.isHidden = true
        } else {
            doneButton.setImage(UIImage(named: "circle"), for: .normal)
            detailInformation.font = .systemFont(ofSize: 12, weight: .medium)
            detailInformation.textColor = .white
            strikedTitle.isHidden = true
            title.isHidden = false
        }
    }
    
    @objc func handleTap() {
        guard let model else {
            return
        }
        onDoneStateChanged?(model.id)
    }
    
    func configureTapHandler() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
}
