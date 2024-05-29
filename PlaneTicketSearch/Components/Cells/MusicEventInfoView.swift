//
//  HScrollViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct MusicEventInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 8) {
                Image("placeholder")
                    .resizable()
                    .frame(width: 133, height: 133)
                    .cornerRadius(16)
                Text("Карточка 1")
                    .font(.system(size: 16, weight: .bold))
                Text("Город 1")
                    .font(.system(size: 14, weight: .regular))
            }
            HStack(spacing: 0) {
                Image("plane")
                    .renderingMode(.template)
                    .foregroundColor(.dGrey6)
                Text("от 1 ₽")
                    .font(.system(size: 14, weight: .regular))
            }
        }
        .background(.dBlack)
        .foregroundColor(.dWhite)
    }
}

#Preview {
    MusicEventInfoView()
}


