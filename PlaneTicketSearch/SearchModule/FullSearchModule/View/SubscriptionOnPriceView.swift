//
//  SubscriptionOnPriceView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SubscriptionOnPriceView: View {
    @State private var subscriptionToggle = false
    var body: some View {
        HStack {
            Image("subscription")
                .renderingMode(.template)
                .foregroundStyle(.dBlue)
            
            Text("Подписка на цену")
                .foregroundStyle(.dWhite)
            Toggle(isOn: $subscriptionToggle) {}
                .tint(.dBlue)
        }
        .padding(.vertical, 13)
        .padding(.leading, 16)
        .padding(.trailing, 11)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.dGrey2)
        )
    }
}

#Preview {
    SubscriptionOnPriceView()
}
