//
//  SearchViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchViewMainScreen: View {
    var body: some View {
        HStack(spacing: 17) {
            Image("lens")
                .renderingMode(.template)
                .foregroundColor(.dGrey7)
                .padding(.leading, 8)
            VStack (alignment: .leading) {
                Text("Minsk")
                    .foregroundColor(.dWhite)
                    .font(.system(size: 16))
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                Divider()
                    .background(.dGrey7)
                Text("Where - Turkey")
                    .foregroundColor(.dWhite)
                    .font(.system(size: 16))
                    .padding(.top, 8)
                    .padding(.bottom, 16)
            }
            .padding(.trailing, 16)
            .bold()
        }
        .background(.dGrey5)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .shadow(color: .dBlack, radius: 7, x: 0, y: 7)
    }
}

#Preview {
    SearchViewMainScreen()
}
