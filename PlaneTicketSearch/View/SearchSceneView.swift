//
//  SearchSceneView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchSceneView: View {
    var body: some View {
        ZStack {
            Color.dGrey1.ignoresSafeArea()
            VStack(spacing: 26) {
                SearchViewSearchScreen()
                ButtonsViewSearchScene()
                PopularDestViewSearchScene()
                Spacer()
            }
            .background(.dGrey1)
            .padding([.leading, .trailing], 16)
            .padding(.top, 46)
        }
        .background(.dGrey2)
    }
}

#Preview {
    SearchSceneView()
}
