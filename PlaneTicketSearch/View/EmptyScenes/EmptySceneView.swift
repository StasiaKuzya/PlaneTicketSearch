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
            VStack() {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .renderingMode(.template)
                            .foregroundStyle(.dWhite)
                    }
                    .padding([.top, .leading], 16)
                    Spacer()
                }
                Spacer()
                Text("Welcome to EmptySceneView")
                    .foregroundStyle(.dWhite)
                Spacer()
            }
        }
    }
}

#Preview {
    EmptySceneView()
}
