//
//  AllTicketInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct AllTicketInfoView: View {
    @StateObject var allTicketsViewModel = AllTicketsViewModel()
    
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            VStack {
                UserShortFlightInfoView()
                    .padding(.top, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(allTicketsViewModel.shortTicketInfo, id: \.id) { shortTicketInfo in
                            ShortTicketInfoView(shortTicketInfo: shortTicketInfo)
                        }
                    }
                }
                .padding(.top, 34)
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            .onAppear{ allTicketsViewModel.fetchData() }
        }
    }
}

#Preview {
    AllTicketInfoView()
}
