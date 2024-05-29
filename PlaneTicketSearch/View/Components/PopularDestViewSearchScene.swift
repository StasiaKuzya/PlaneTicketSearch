//
//  PopularDestViewSearchScene.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct PopularDestViewSearchScene: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PopularDestView()
            Divider()
                .background(.dGrey7)

            PopularDestView()
            Divider()
                .background(.dGrey7)
            PopularDestView()
            Divider()
                .background(.dGrey7)
                .padding(.bottom, 16)
        }
        .padding([.leading, .trailing], 16)
        .background(.dGrey4)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    PopularDestViewSearchScene()
}


struct PopularDestView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("placeholder")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFill()
                .cornerRadius(8)
            VStack (alignment: .leading, spacing: 4) {
                Text("Minsk")
                    .foregroundColor(.dWhite)
                    .font(.system(size: 16, weight: .bold))
                Text("Where - Turkey")
                    .foregroundColor(.dGrey6)
                    .font(.system(size: 16))
                
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
}
