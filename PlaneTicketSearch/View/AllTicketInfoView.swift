//
//  AllTicketInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct AllTicketInfoView: View {
    @StateObject var allTicketsViewModel = AllTicketsViewModel()
    @StateObject var dateViewModel = DateViewModel()
    
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            VStack {
                UserShortFlightInfoView(dateViewModel: dateViewModel)
                    .padding(.top, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(allTicketsViewModel.shortTicketInfo, id: \.id) { shortTicketInfo in
                            ShortTicketInfoView(shortTicketInfo: shortTicketInfo)
                        }
                    }
                    .offset(y: 9)
                }
                .padding(.top, 26)
                
            }
            .padding(.horizontal, 16)
            .onAppear{ allTicketsViewModel.fetchData() }
            
            VStack{
                Spacer()
                FilterPricesView()
                    .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    AllTicketInfoView()
}
