//
//  MainViewModel.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var musicEvents: [MusicEvent] = []
    
    private var networkService = NetworkService()
    
    func fetchData() {
        guard let url = URL(string: Constants.baseMainURL) else { return }

        networkService.request(url: url) { [weak self] (result: Result<MainModel, Error>) in
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
