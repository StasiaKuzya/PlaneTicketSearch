//
//  SearchViewModel.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 30.05.2024.
//

import Foundation
class SearchViewModel: ObservableObject {
    @Published var ticketsOffers: [TicketsOffer] = []
    
    private var networkService = NetworkService()
    
    func fetchData() {
        guard let url = URL(string: Constants.baseSearchURL) else { return }

        networkService.request(url: url) { [weak self] (result: Result<SearchModel, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchModel):
                    self?.ticketsOffers = searchModel.ticketsOffers
                case .failure(let error):
                    print("Ошибка при загрузке пользователей: \(error.localizedDescription)")
                }
            }
        }
    }
}
