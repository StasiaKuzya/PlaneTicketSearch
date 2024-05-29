//
//  AllTicketInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct AllTicketInfoView: View {
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            VStack {
                UserShortFlightInfoView()
                    .padding(.top, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(1...10, id: \.self) { num in
                            ShortTicketInfoView()
                        }
                    }
                }
                .padding(.top, 34)
                Spacer()
            }
            .padding([.leading, .trailing], 16)
        }
    }
}

#Preview {
    AllTicketInfoView()
}
