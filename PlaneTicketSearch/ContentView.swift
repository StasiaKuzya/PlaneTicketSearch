//
//  ContentView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .dGrey6
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color.dBlack.ignoresSafeArea()
                    VStack(spacing: 32) {
                        Text("Поиск дешевых авиабилетов")
                            .foregroundColor(.dWhite)
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 172)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.top, 26)
                        
                        SearchViewMainScreen()
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.dGrey2))
                            )
                        VStack (alignment: .leading, spacing: 26) {
                            Text("Музыкально отлететь")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.dWhite)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 67) {
                                    ForEach(1...10, id: \.self) { num in
                                        MusicEventInfoView()
                                    }
                                }
                            }
                            .frame(height: 214)
                        }
                        
                        Spacer()
                    }
                }
                .padding([.leading, .trailing], 16)
                .background(.dBlack)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {}
            .tabItem {
                Image("plane")
                    .renderingMode(.template)
                Text("Авиабилеты")
            }
            Text("")
                .tabItem {
                    Image("hotels")
                        .renderingMode(.template)
                    Text("Отели")
                }
            Text("")
                .tabItem {
                    Image("location")
                        .renderingMode(.template)
                    Text("Короче")
                }
            Text("")
                .tabItem {
                    Image("subscription")
                        .renderingMode(.template)
                    Text("Подписки")
                }
            Text("")
                .tabItem {
                    Image("profile")
                        .renderingMode(.template)
                    Text("Профиль")
                }
        }
        .accentColor(.dDarkBlue)
    }
}

#Preview {
    MainView()
}
