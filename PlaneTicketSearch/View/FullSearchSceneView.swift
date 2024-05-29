//
//  FullSearchSceneView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct FullSearchSceneView: View {
    @State private var showAllTicketInfoScene = false
    
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            VStack(spacing: 15) {
                SearchViewFullSearchScreen()
                FiltersView()
                ShortFlightInfoTabView()
                Button {
                    showAllTicketInfoScene.toggle()
                } label: {
                    Text("Посмотреть все билеты")
                        .font(.system(size: 16))
                        .italic()
                        .padding([.top, .bottom], 13)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dBlue))
                        )
                        .foregroundColor(.dWhite)
                }
                .padding(.top, 3)
                SubscriptionOnPriceView()
                    .padding(.top, 9)
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 47)
        }
        .fullScreenCover(isPresented: $showAllTicketInfoScene) {
            AllTicketInfoView()
        }
    }
}

#Preview {
    FullSearchSceneView()
}