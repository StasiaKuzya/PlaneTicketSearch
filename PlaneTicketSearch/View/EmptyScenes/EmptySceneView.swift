//
//  DifficultRoutSceneView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 29.05.2024.
//

import SwiftUI

struct EmptySceneView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color.dBlack.ignoresSafeArea()
            Text("Welcome to EmptySceneView")
                .foregroundStyle(.dWhite)
        }
    }
}

#Preview {
    EmptySceneView()
}
