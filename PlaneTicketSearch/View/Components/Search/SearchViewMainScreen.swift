//
//  SearchViewMainScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct SearchViewMainScreen: View {
    @AppStorage("departurePlace") var departurePlace = "Откуда - Москва"
    @State private var showModalSearchScene = false
    
    var body: some View {
        HStack(spacing: 17) {
            Image("lens")
                .renderingMode(.template)
                .foregroundColor(.dGrey7)
                .padding(.leading, 8)
            VStack (alignment: .leading) {
                TextField("Откуда - Москва", text: $departurePlace)
                    .onChange(of: departurePlace) {}
                    .foregroundColor(.dWhite)
                    .font(.system(size: 16))
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                Divider()
                    .background(.dGrey7)
                Button {
                    showModalSearchScene.toggle()
                } label: {
                    Text("Куда - Турция")
                        .foregroundColor(.dGrey6)
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
        .shadow(color: .dBlack, radius: 7, x: 0, y: 7)
        .sheet(isPresented: $showModalSearchScene) {
            SearchSceneView()
        }
    }
}

#Preview {
    SearchViewMainScreen()
}

extension String {
    var isCyrillic: Bool {
        let cyrillic = CharacterSet(charactersIn:
          "ЁёЙйЦцУуКкЕеНнГгШшЩщЗзХхЪъФфЫыВвАаПпРрОоЛлДдЖжЭэЯяЧчСсМмИиТтЬьБбЮю"
        )
        return self.rangeOfCharacter(from: cyrillic.inverted) == nil
    }
}
