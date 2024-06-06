//
//  PopularDestViewSearchScene.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct PopularDestViewSearchScene: View {
    @AppStorage("arrivalPlace") var arrivalPlace = "Куда - Турция"
    @State private var showFullSearchScene = false
    @Binding var showFullSearchScreen: Bool
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                destination("Стамбул")
            } label: {
                PopularDestView(cityName: "Стамбул", cityAssetImage: "ist")
            }
            Divider()
                .background(.dGrey7)
            
            Button {
                destination("Сочи")
            } label: {
                PopularDestView(cityName: "Сочи", cityAssetImage: "sochi")
            }
            Divider()
                .background(.dGrey7)
            
            Button {
                destination("Пхукет")
            } label: {
                PopularDestView(cityName: "Пхукет", cityAssetImage: "phuket")
            }
            Divider()
                .background(.dGrey7)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
        .background(.dGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
    
    private func destination(_ place: String) {
        self.arrivalPlace = place
        self.presentationMode.wrappedValue.dismiss()
        self.showFullSearchScreen = true
    }
}

#Preview {
    PopularDestViewSearchScene(showFullSearchScreen: .constant(true))
}


struct PopularDestView: View {
    var cityName: String
    var cityAssetImage: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("\(cityAssetImage)")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFill()
                .cornerRadius(8)
            VStack (alignment: .leading, spacing: 4) {
                Text(cityName)
                    .foregroundStyle(.dWhite)
                    .font(.system(size: 16, weight: .bold))
                Text("Популярное направление")
                    .foregroundStyle(.dGrey6)
                    .font(.system(size: 16))
                
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
}
