//
//  ShortFlightInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ShortFlightInfoTabView: View {
    @State private var showAllTicketInfoScene = false
    var ticketsOffers: [TicketsOffer]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Прямые рейсы")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.dWhite)
                .padding(.top, 16)
            
            ForEach(ticketsOffers.prefix(3).indices, id: \.self) { index in
                let color = getColorForIndex(index: index)
                ShortFlightInfoView(ticketsOffer: ticketsOffers[index], circleColor: color)
            }
            Button {
                showAllTicketInfoScene.toggle()
            } label: {
                NavigationLink(destination: AllTicketInfoView(), isActive: $showAllTicketInfoScene) {
                    Text("Показать все")
                        .font(.system(size: 16))
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.dBlue)
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 16)
        .background(.dGrey2)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
    
    private func getColorForIndex(index: Int) -> Color {
        switch index {
        case 0:
            return .dRed
        case 1:
            return .dBlue
        case 2:
            return .dWhite
        default:
            return .dRed
        }
    }
}

#Preview {
    ShortFlightInfoTabView(ticketsOffers: [TicketsOffer(id: 1,
                                                      title: "Belavia",
                                                      timeRange: ["07:00", "09:00"],
                                                      price: Price(value: 2350))])
}

struct ShortFlightInfoView: View {
    var ticketsOffer: TicketsOffer
    var circleColor: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Circle()
                .fill(circleColor)
                .frame(width: 24, height: 24)
            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text(ticketsOffer.title)
                        .italic()
                    Spacer()
                    Text("\(ticketsOffer.price.value) ₽")
                        .italic()
                        .foregroundStyle(.dBlue)
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundStyle(.dBlue)
                }
                Text(ticketsOffer.timeRange.joined(separator: ", "))
                    .lineLimit(1)
            }
            .foregroundStyle(.dWhite)
            .font(.system(size: 14))
        }
        .padding(.top, 8)
        .background(.dGrey2)
        Divider()
            .background(.dGrey7)
    }
}
