//
//  Int.swift
//  ToDoList
//
//  Created by student on 17.11.2024.
//

import Foundation

extension Int {
    
    /// Return pluralized form of word
    
    func pluralized(forms: (String, String, String)) -> String {
        let reminderOfTen = self % 10
        let reminderOfOneHundred = self % 100
        
        if reminderOfTen == 1 && reminderOfOneHundred != 11 {
            return forms.0
        } else if (2...4).contains(reminderOfTen) && !(12...14).contains(reminderOfOneHundred) {
            return forms.1
        } else {
            return forms.2
        }
    }

}
