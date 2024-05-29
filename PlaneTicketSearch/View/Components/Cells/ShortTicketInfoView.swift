//
//  VScrollTicketInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct ShortTicketInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("7 3490 ₽")
                .foregroundStyle(.dWhite)
                .font(.system(size: 22, weight: .bold))
            
            HStack(spacing: 7) {
                Circle()
                    .fill(.dRed)
                    .frame(width: 24)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("15:00")
                            .foregroundStyle(.dWhite)
                        Text("DME")
                            .foregroundStyle(.dGrey6)
                    }
                    .italic()
                    
                    Text("-")
                        .foregroundStyle(.dGrey6)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("18:00")
                            .foregroundStyle(.dWhite)
                        Text("AER")
                            .foregroundStyle(.dGrey6)
                    }
                    .italic()
                    
                    Spacer()
                    Text("3,5 часа / без пересадок")
                        .foregroundStyle(.dWhite)
                }
                .font(.system(size: 14))
            }
        }
        .padding([.top, .leading], 16)
        .padding(.bottom, 23)
        .padding(.trailing, 4)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.dGrey2))
        )
    }
}

#Preview {
    ShortTicketInfoView()
}
