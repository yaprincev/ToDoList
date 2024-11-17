//
//  String.swift
//  ToDoList
//
//  Created by student on 17.11.2024.
//

import UIKit

extension String {
    
    /// Return text with strike
    
    func withStrikeTrough() -> NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
    }
    
}
