//
//  SearchViewSearchScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchViewSearchScreen: View {
    @AppStorage("departurePlace") var departurePlace = "Москва"
    @Binding var showFullSearchScreen: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 8) {
                Image("plane2")
                    .renderingMode(.template)
                    .foregroundStyle(.dGrey7)
                    .padding(.leading, 8)
                TextField("",
                          text: $departurePlace,
                          prompt: Text("Откуда - Москва")
                            .foregroundColor(.dGrey6))
                    .onChange(of: departurePlace) {}
                    .foregroundStyle(.dWhite)
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            Divider()
                .background(.dGrey7)
            Button {
                self.presentationMode.wrappedValue.dismiss()
                showFullSearchScreen = true
            } label: {
                
                HStack(spacing: 8) {
                    Image("lens")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                        .padding(.leading, 8)
                    Text("Куда - Турция")
                        .foregroundStyle(.dGrey6)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    Button {
                        // TODO: dismiss
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.dGrey3)
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundStyle(.dGrey7)
                                .frame(width: 9, height: 9)
                                .bold()
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 16)
        .background(.dGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .shadow(color: .dBlack, radius: 7, x: 0, y: 7)
    }
}

#Preview {
    SearchViewSearchScreen(showFullSearchScreen: .constant(true))
}
