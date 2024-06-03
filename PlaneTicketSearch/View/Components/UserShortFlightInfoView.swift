//
//  UserShortFlightInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct UserShortFlightInfoView: View {
    @AppStorage("departurePlace") var departurePlace = "Откуда - Москва"
    @AppStorage("arrivalPlace") var arrivalPlace = "Куда - Турция"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var dateViewModel = DateViewModel()
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("backArrow")
                    .renderingMode(.template)
                    .foregroundStyle(.dBlue)
            }
            VStack (alignment: .leading, spacing: 4) {
                Text("\(departurePlace) - \(arrivalPlace)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.dWhite)
                Text(dateFormat(date: dateViewModel.selectedDate) + ", 1 пассажир")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.dGrey6)
            }
            .padding(.vertical, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .background(.dGrey2)
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM"
        return formatter.string(from: date)
    }
}

#Preview {
    UserShortFlightInfoView()
}
