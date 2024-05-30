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
                .foregroundColor(.dWhite)
                .padding(.top, 16)
            
            ForEach(ticketsOffers.prefix(3), id: \.id) { ticketsOffer in
                ShortFlightInfoView(ticketsOffer: ticketsOffer)
            }
            Button {
                showAllTicketInfoScene.toggle()
            } label: {
                Text("Показать все")
                    .font(.system(size: 16))
                    .padding([.top, .bottom], 10)
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 10)

        }
        .padding([.leading, .trailing], 16)
        .background(.dGrey2)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .fullScreenCover(isPresented: $showAllTicketInfoScene) {
            AllTicketInfoView()
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
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Circle()
                .fill(.dBlue)
                .frame(width: 24, height: 24)
            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text(ticketsOffer.title)
                        .italic()
                    Spacer()
                    Text("\(ticketsOffer.price.value) ₽")
                        .italic()
                        .foregroundColor(.dBlue)
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundColor(.dBlue)
                }
                Text(ticketsOffer.timeRange.joined(separator: ", "))
                    .lineLimit(1)
            }
            .foregroundColor(.dWhite)
            .font(.system(size: 14))
        }
        .padding(.top, 8)
        .background(.dGrey2)
        Divider()
            .background(.dGrey7)
    }
}
