//
//  ButtonsViewSearchScene.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ButtonsViewSearchScene: View {
    @State private var showDifficultRoutScene = false
    @State private var showWhereGoScene = false
    @State private var showWeekendScene = false
    @State private var showHotTourScene = false
    @AppStorage("arrivalPlace") var arrivalPlace = "Куда - Турция"
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                showDifficultRoutScene.toggle()
            } label: {
                VStack (spacing: 8) {
                    Image("figure")
                        .renderingMode(.template)
                        .foregroundColor(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dGreen))
                        )
                    Text("Сложный\nмаршрут")
                        .foregroundColor(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                arrivalPlace = "Куда угодно"
                showWhereGoScene.toggle()
            } label: {
                VStack (spacing: 8) {
                    Image("globe")
                        .renderingMode(.template)
                        .foregroundColor(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dBlue))
                        )
                    Text("Куда угодно")
                        .foregroundColor(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                showWeekendScene.toggle()
            } label: {
                VStack (spacing: 8) {
                    Image("schedule")
                        .renderingMode(.template)
                        .foregroundColor(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dDarkBlue))
                        )
                    Text("Выходные")
                        .foregroundColor(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            Spacer()
            Button {
                showHotTourScene.toggle()
            } label: {
                VStack (spacing: 8) {
                    Image("fire")
                        .renderingMode(.template)
                        .foregroundColor(.dWhite)
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.dRed))
                        )
                    Text("Горячие\nбилеты")
                        .foregroundColor(.dWhite)
                        .font(.system(size: 14))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.dGrey1)
        .fullScreenCover(isPresented: $showDifficultRoutScene) {
            EmptySceneView()
        }
        .fullScreenCover(isPresented: $showWhereGoScene) {
            FullSearchSceneView()
        }
        .fullScreenCover(isPresented: $showWeekendScene) {
            EmptySceneView()
        }
        .fullScreenCover(isPresented: $showHotTourScene) {
            EmptySceneView()
        }
        
    }
}

#Preview {
    ButtonsViewSearchScene()
}
