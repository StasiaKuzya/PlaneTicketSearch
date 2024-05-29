//
//  ShortFlightInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ShortFlightInfoTabView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Прямые рейсы")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.dWhite)
                .padding(.top, 16)
            ShortFlightInfoView()
            ShortFlightInfoView()
            ShortFlightInfoView()
            Button {
                
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
    }
}

#Preview {
    ShortFlightInfoTabView()
}

struct ShortFlightInfoView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Circle()
                .fill(.dBlue)
                .frame(width: 24)
            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text("Belavia")
                        .italic()
                    Spacer()
                    Text("2 340 ₽")
                        .italic()
                        .foregroundColor(.dBlue)
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundColor(.dBlue)
                }
                Text("07:00 07:00 07:00 07:00 07:00 07:00 07:00 07:00 07:00")
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
