//
//  SearchViewFullSearchScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

//TODO: get rid of code's repeating 
import SwiftUI

struct SearchViewFullSearchScreen: View {
    var body: some View {
        HStack(spacing: 17) {
            Button {
                
            } label: {
                Image("backArrow")
                    .renderingMode(.template)
                    .foregroundColor(.dGrey7)
                    .padding(.leading, 8)
            }
            VStack (alignment: .leading) {
                HStack {
                    Text("Minsk")
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
                            Image("swap")
                                .resizable()
                                .foregroundColor(.dGrey7)
                                .frame(width: 12, height: 12)
                                .bold()
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 8)
                Divider()
                    .background(.dGrey7)
                HStack {
                    Text("Where - Turkey")
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
            .padding(.trailing, 16)
            .bold()
        }
        .background(.dGrey4)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .shadow(color: .dBlack, radius: 7, x: 0, y: 7)
    }
}

#Preview {
    SearchViewFullSearchScreen()
}
