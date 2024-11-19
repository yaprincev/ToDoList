//
//  NetworkService.swift
//  ToDoList
//
//  Created by student on 19.11.2024.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func getTasks <T: Decodable>(forURL url: URL?, model: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}


class NetworkService: NetworkConfiguration, NetworkServiceProtocol {
    
    func getTasks <T: Decodable>(forURL url: URL?, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url else {
            return
        }
        self.session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try self.decoder.decode(model.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
