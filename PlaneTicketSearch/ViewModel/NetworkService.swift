//
//  NetworkService.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import Foundation

class NetworkService {
    func request(url: URL, completion: @escaping (Result<MainModel, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(MainModel.self, from: data)
                        completion(.success(decodedData))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
