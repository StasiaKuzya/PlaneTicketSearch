//
//  ContentView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel()
    @State private var showDifficultRoutScene = false
    @State private var showFullSearchScreen = false
    @State private var showWeekendScene = false
    @State private var showHotTourScene = false
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .dGrey6
        UITabBar.appearance().backgroundColor = .dBlack
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color.dBlack.ignoresSafeArea()
                    VStack(spacing: 32) {
                        Text("Поиск дешевых авиабилетов")
                            .foregroundStyle(.dWhite)
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 172)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.top, 26)
                            SearchViewMainScreen(
                                showDifficultRoutScene: $showDifficultRoutScene,
                                showFullSearchScreen: $showFullSearchScreen,
                                showWeekendScene: $showWeekendScene,
                                showHotTourScene: $showHotTourScene
                            )
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.dGrey3))
                            )
                        VStack (alignment: .leading, spacing: 26) {
                            Text("Музыкально отлететь")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.dWhite)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 67) {
                                    ForEach(mainViewModel.musicEvents, id: \.id) { event in
                                        MusicEventInfoView(event: event)
                                    }
                                }
                            }
                            .frame(height: 214)
                        }
                        
                        Spacer()
                    }

                    NavigationLink(destination: FullSearchSceneView(), isActive: $showFullSearchScreen) { EmptyView() }
                    NavigationLink(destination: EmptySceneView(), isActive: $showDifficultRoutScene) { EmptyView() }
                    NavigationLink(destination: EmptySceneView(), isActive: $showWeekendScene) { EmptyView() }
                    NavigationLink(destination: EmptySceneView(), isActive: $showHotTourScene) { EmptyView() }
                }
                .padding(.horizontal, 16)
                .background(.dBlack)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear { mainViewModel.fetchData()}
            .tabItem {
                Image("plane")
                    .renderingMode(.template)
                Text("Авиабилеты")
            }
            Text("Отели")
                .tabItem {
                    Image("hotels")
                        .renderingMode(.template)
                    Text("Отели")
                }
            Text("Короче")
                .tabItem {
                    Image("location")
                        .renderingMode(.template)
                    Text("Короче")
                }
            Text("Подписки")
                .tabItem {
                    Image("subscription")
                        .renderingMode(.template)
                    Text("Подписки")
                }
            Text("Профиль")
                .tabItem {
                    Image("profile")
                        .renderingMode(.template)
                    Text("Профиль")
                }
        }
        .accentColor(.dBlue)
    }
}

#Preview {
    MainView()
}
