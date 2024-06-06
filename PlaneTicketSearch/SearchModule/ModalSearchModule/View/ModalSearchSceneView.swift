//
//  SearchSceneView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ModalSearchSceneView: View {
    @Binding var showDifficultRoutScene: Bool
    @Binding var showFullSearchScreen: Bool
    @Binding var showWeekendScene: Bool
    @Binding var showHotTourScene: Bool

    var body: some View {
        ZStack {
            Color.dGrey1.ignoresSafeArea()
            VStack(spacing: 26) {
                SearchViewSearchScreen(showFullSearchScreen: $showFullSearchScreen)
                
                ButtonsViewSearchScene(
                    showDifficultRoutScene: $showDifficultRoutScene,
                    showFullSearchScreen: $showFullSearchScreen,
                    showWeekendScene: $showWeekendScene,
                    showHotTourScene: $showHotTourScene)
                
                PopularDestViewSearchScene(showFullSearchScreen: $showFullSearchScreen)
                Spacer()
            }
            .background(.dGrey1)
            .padding(.horizontal, 16)
            .padding(.top, 46)
        }
        .background(.dGrey2)
    }
}

#Preview {
    ModalSearchSceneView(
        showDifficultRoutScene: .constant(true),
        showFullSearchScreen: .constant(true),
        showWeekendScene: .constant(true),
        showHotTourScene: .constant(true)
    )
}
