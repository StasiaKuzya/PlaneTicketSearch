//
//  FullSearchSceneView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct FullSearchSceneView: View {
    @StateObject var searchViewModel: SearchViewModel = .init()
    @StateObject var dateViewModel: DateViewModel = .init()
    @State private var showAllTicketInfoScene = false
    
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            VStack(spacing: 15) {
                SearchViewFullSearchScreen()
                FiltersView(dateViewModel: dateViewModel)
                ShortFlightInfoTabView(ticketsOffers: searchViewModel.ticketsOffers)
                Button {
                    showAllTicketInfoScene.toggle()
                } label: {
                    NavigationLink(destination: AllTicketInfoView(dateViewModel: dateViewModel), isActive: $showAllTicketInfoScene) {
                        Text("Посмотреть все билеты")
                            .font(.system(size: 16))
                            .italic()
                            .padding(.vertical, 13)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.dBlue))
                            )
                            .foregroundStyle(.dWhite)
                    }
                }
                .padding(.top, 3)
                SubscriptionOnPriceView()
                    .padding(.top, 9)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 47)
        }
        .onAppear{ searchViewModel.fetchData() }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FullSearchSceneView()
}
