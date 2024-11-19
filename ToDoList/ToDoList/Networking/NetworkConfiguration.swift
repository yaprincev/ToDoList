//
//  NetworkConfiguration.swift
//  ToDoList
//
//  Created by student on 19.11.2024.
//

import Foundation

class NetworkConfiguration {
    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared
}
