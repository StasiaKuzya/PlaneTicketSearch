//
//  NetworkService.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import Foundation

final class NetworkService {
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
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
