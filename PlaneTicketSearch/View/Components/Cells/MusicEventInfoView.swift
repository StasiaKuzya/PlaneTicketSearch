//
//  HScrollViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct MusicEventInfoView: View {
    var event: MusicEvent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 8) {
                Image("placeholderMain\(event.id)")
                    .resizable()
                    .frame(width: 133, height: 133)
                    .cornerRadius(16)
                Text(event.title)
                    .font(.system(size: 16, weight: .bold))
                Text(event.town)
                    .font(.system(size: 14, weight: .regular))
            }
            HStack(spacing: 0) {
                Image("plane")
                    .renderingMode(.template)
                    .foregroundColor(.dGrey6)
                Text("от \(event.price.value) ₽")
                    .font(.system(size: 14, weight: .regular))
            }
        }
        .background(.dBlack)
        .foregroundColor(.dWhite)
    }
}

#Preview {
    MusicEventInfoView(event: MusicEvent(
        id: 1,
        title: "Die Antwoord",
        town: "Будапешт",
        price: Price(value: 5000)))
}


