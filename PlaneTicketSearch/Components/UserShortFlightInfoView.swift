//
//  UserShortFlightInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct UserShortFlightInfoView: View {
    @State private var showModalSearchScene = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Button {
                //TODO: dismiss segue
            } label: {
                Image("backArrow")
                    .renderingMode(.template)
                    .foregroundColor(.dBlue)
            }
            VStack (alignment: .leading, spacing: 4) {
                Text("Minsk - Sochi")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.dWhite)
                Text("23 Feb, 1 passanger")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.dGrey6)
            }
            .padding([.top, .bottom], 8)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .background(.dGrey2)
        .sheet(isPresented: $showModalSearchScene) {
            SearchSceneView()
        }
    }
}

#Preview {
    UserShortFlightInfoView()
}
