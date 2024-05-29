//
//  MainModel.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import Foundation

// MARK: - Welcome
struct MainModel: Codable {
    let offers: [MusicEvent]
}

// MARK: - Offer
struct MusicEvent: Codable {
    let id: Int
    let title, town: String
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
