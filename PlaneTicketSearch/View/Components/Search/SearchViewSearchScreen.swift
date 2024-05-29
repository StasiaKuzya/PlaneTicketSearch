//
//  SearchViewSearchScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchViewSearchScreen: View {
    @AppStorage("departurePlace") var departurePlace = "Москва"
    @State private var showFullSearchScene = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 8) {
                Image("plane2")
                    .renderingMode(.template)
                    .foregroundColor(.dGrey7)
                    .padding(.leading, 8)
                Text(departurePlace)
                    .foregroundColor(.dWhite)
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            Divider()
                .background(.dGrey7)
            Button {
                showFullSearchScene.toggle()
            } label: {
                
                HStack(spacing: 8) {
                    Image("lens")
                        .renderingMode(.template)
                        .foregroundColor(.dGrey7)
                        .padding(.leading, 8)
                    Text("Куда - Турция")
                        .foregroundColor(.dWhite)
                        .font(.system(size: 16))
                    Spacer()
                    Button {
                        // TODO: dismiss
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.dGrey4)
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.dGrey7)
                                .frame(width: 9, height: 9)
                                .bold()
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
        }
        .padding([.leading, .trailing], 16)
        .background(.dGrey4)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .shadow(color: .dBlack, radius: 7, x: 0, y: 7)
        .fullScreenCover(isPresented: $showFullSearchScene) {
            FullSearchSceneView()
        }
    }
}

#Preview {
    SearchViewSearchScreen()
}
