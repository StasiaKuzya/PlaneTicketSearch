//
//  ButtonsViewSearchScene.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ButtonsViewSearchScene: View {
    @AppStorage("arrivalPlace") var arrivalPlace = ""
    @Binding var showDifficultRoutScene: Bool
    @Binding var showFullSearchScreen: Bool
    @Binding var showWeekendScene: Bool
    @Binding var showHotTourScene: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                segue(to: &showDifficultRoutScene)
            } label: {
                VStack (spacing: 8) {
                    Image("figure")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dGreen))
                        )
                    Text("Сложный\nмаршрут")
                        .foregroundStyle(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                arrivalPlace = "Куда угодно"
                segue(to: &showFullSearchScreen)
            } label: {
                VStack (spacing: 8) {
                    Image("globe")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dBlue))
                        )
                    Text("Куда угодно")
                        .foregroundStyle(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                segue(to: &showWeekendScene)
            } label: {
                VStack (spacing: 8) {
                    Image("schedule")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dDarkBlue))
                        )
                    Text("Выходные")
                        .foregroundStyle(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                segue(to: &showHotTourScene)
            } label: {
                VStack (spacing: 8) {
                    Image("fire")
                        .renderingMode(.template)
                        .foregroundStyle(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dRed))
                        )
                    Text("Горячие\nбилеты")
                        .foregroundStyle(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.dGrey1)
    }
    
    private func segue(to scene: inout Bool) {
        scene = true
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    ButtonsViewSearchScene(
        showDifficultRoutScene: .constant(true),
        showFullSearchScreen: .constant(true),
        showWeekendScene: .constant(true),
        showHotTourScene: .constant(true)
    )
}
