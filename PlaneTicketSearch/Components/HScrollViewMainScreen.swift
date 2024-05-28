//
//  HScrollViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct HScrollViewMainScreen: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 26) {
            Text("Музыкально отлететь")
                .font(.system(size: 22, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 67) {
                    ForEach(1...10, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 4) {
                            VStack(alignment: .leading, spacing: 8) {
                                Image("placeholder")
                                    .resizable()
                                    .frame(width: 133, height: 133)
                                    .cornerRadius(16)
                                Text("Карточка \(num)")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Город \(num)")
                                    .font(.system(size: 14, weight: .regular))
                            }
                            HStack(spacing: 0) {
                                Image("plane")
                                    .renderingMode(.template)
                                    .foregroundColor(.dGrey6)
                                Text("от \(num) ₽")
                                    .font(.system(size: 14, weight: .regular))
                            }
                        }
                    }
                }
            }
            .frame(height: 214)
        }
        .background(.dBlack)
        .foregroundColor(.dWhite)
    }
}

#Preview {
    HScrollViewMainScreen()
}
