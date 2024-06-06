//
//  TabBarView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 06.06.2024.
//

import SwiftUI
enum Tabs: Hashable {
    case main
    case hotels
    case short
    case subscription
    case profile
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .main
}

struct TabBarView: View {
    @StateObject var router: Router = .init()
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .dGrey6
        UITabBar.appearance().backgroundColor = .dBlack
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            MainView().tabItem {
                Image("plane").renderingMode(.template)
                Text("Авиабилеты")
            }.tag(Tabs.main)
            
            Text("Отели").tabItem {
                Image("hotels").renderingMode(.template)
                Text("Отели")
            }.tag(Tabs.hotels)
            
            Text("Короче").tabItem {
                Image("location").renderingMode(.template)
                Text("Короче")
            }.tag(Tabs.short)
            
            Text("Подписки").tabItem {
                Image("subscription").renderingMode(.template)
                Text("Подписки")
            }.tag(Tabs.subscription)
            
            Text("Профиль").tabItem {
                Image("profile").renderingMode(.template)
                Text("Профиль")
            }.tag(Tabs.profile)
        }
        .accentColor(.dBlue)
    }
}

#Preview {
    TabBarView()
}
