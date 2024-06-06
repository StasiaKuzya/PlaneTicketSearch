//
//  SearchViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchViewMainScreen: View {
    @AppStorage("departurePlace") var departurePlace = ""
    @State private var showModalSearchScene = false
    @Binding var showDifficultRoutScene: Bool
    @Binding var showFullSearchScreen: Bool
    @Binding var showWeekendScene: Bool
    @Binding var showHotTourScene: Bool
    
    var body: some View {
        HStack(spacing: 17) {
            Image("lens")
                .renderingMode(.template)
                .foregroundStyle(.dGrey7)
                .padding(.leading, 8)
            VStack (alignment: .leading) {
                TextField("",
                          text: $departurePlace,
                          prompt: Text("Откуда - Москва")
                    .foregroundColor(.dGrey6))
                .onChange(of: departurePlace) {}
                .foregroundStyle(.dWhite)
                .font(.system(size: 16))
                .padding(.top, 16)
                .padding(.bottom, 8)
                Divider()
                    .background(.dGrey7)
                Button {
                    showModalSearchScene.toggle()
                    if departurePlace.isEmpty {
                        departurePlace = "Москва"
                    }
                } label: {
                    Text("Куда - Турция")
                        .foregroundStyle(.dGrey6)
                        .font(.system(size: 16))
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            .padding(.trailing, 16)
            .bold()
        }
        .background(.dGrey4)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .shadow(color: .dGrey2, radius: 7, x: 0, y: 7)
        .sheet(isPresented: $showModalSearchScene) {
            ModalSearchSceneView(                   
                showDifficultRoutScene: $showDifficultRoutScene,
                showFullSearchScreen: $showFullSearchScreen,
                showWeekendScene: $showWeekendScene,
                showHotTourScene: $showHotTourScene)
        }
    }
}

#Preview {
    SearchViewMainScreen(
        showDifficultRoutScene: .constant(true),
        showFullSearchScreen: .constant(true),
        showWeekendScene: .constant(true),
        showHotTourScene: .constant(true)
    )
}

extension String {
    var isCyrillic: Bool {
        let cyrillic = CharacterSet(charactersIn:
          "ЁёЙйЦцУуКкЕеНнГгШшЩщЗзХхЪъФфЫыВвАаПпРрОоЛлДдЖжЭэЯяЧчСсМмИиТтЬьБбЮю"
        )
        return self.rangeOfCharacter(from: cyrillic.inverted) == nil
    }
}
