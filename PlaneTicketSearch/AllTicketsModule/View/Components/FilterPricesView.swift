//
//  FilterPricesView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 31.05.2024.
//

import SwiftUI

struct FilterPricesView: View {
    var body: some View {
        HStack(spacing: 16) {
            Button {
                //TODO:
            } label: {
                HStack(spacing: 3) {
                    Image("filters")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                    Text("Фильтры")
                        .font(.system(size: 14))
                        .italic()
                        .foregroundStyle(.dWhite)
                }
            }
            Button {
                //TODO:
            } label: {
                HStack(spacing: 3) {
                    Image("vector")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                    Text("График цен")
                        .font(.system(size: 14))
                        .italic()
                        .foregroundStyle(.dWhite)
                }
            }
        }
        .padding(.all, 10)
        .background(RoundedRectangle(cornerRadius: 50)
            .fill(.dBlue))
    }
}

#Preview {
    FilterPricesView()
}
