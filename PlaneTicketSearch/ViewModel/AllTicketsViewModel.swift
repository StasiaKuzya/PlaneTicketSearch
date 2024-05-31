//
//  AllTicketsViewModel.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 30.05.2024.
//

import Foundation

final class AllTicketsViewModel: ObservableObject {
    @Published var shortTicketInfo: [ShortTicketInfo] = []
    
    private var networkService = NetworkService()
    
    func fetchData() {
        guard let url = URL(string: Constants.baseAllTicketsURL) else { return }

        networkService.request(url: url) { [weak self] (result: Result<AllTicketsModel, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let allTicketsModel):
                    self?.shortTicketInfo = allTicketsModel.tickets
                case .failure(let error):
                    print("Ошибка при загрузке пользователей: \(error.localizedDescription)")
                }
            }
        }
    }
}
