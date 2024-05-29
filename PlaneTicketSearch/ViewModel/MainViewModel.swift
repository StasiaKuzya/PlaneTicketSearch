//
//  MainViewModel.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import Foundation
class MainViewModel: ObservableObject {
    @Published var musicEvents: [MusicEvent] = []
    
    private var networkService = NetworkService()
    
    func fetchPosts() {
        guard let url = URL(string: Constants.baseMainURL) else { return }

        networkService.request(url: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let mainModel):
                    self?.musicEvents = mainModel.offers
                case .failure(let error):
                    print("Ошибка при загрузке пользователей: \(error.localizedDescription)")
                }
            }
        }
    }
}
