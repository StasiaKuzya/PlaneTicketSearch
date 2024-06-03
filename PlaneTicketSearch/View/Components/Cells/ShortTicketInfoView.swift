//
//  VScrollTicketInfoView.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI
import Foundation

struct ShortTicketInfoView: View {
    var shortTicketInfo: ShortTicketInfo
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 16) {
                Text("\(shortTicketInfo.price.value) ₽")
                    .foregroundStyle(.dWhite)
                    .font(.system(size: 22, weight: .bold))
                
                HStack(spacing: 7) {
                    Circle()
                        .fill(.dRed)
                        .frame(width: 24)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(extractTime(from: shortTicketInfo.departure.date) ?? "")
                                .foregroundStyle(.dWhite)
                            Text(shortTicketInfo.departure.airport.rawValue)
                                .foregroundStyle(.dGrey6)
                        }
                        .italic()
                        .frame(width: 40)
                        
                        Text("-")
                            .foregroundStyle(.dGrey6)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(extractTime(from:shortTicketInfo.arrival.date) ?? "")
                                .foregroundStyle(.dWhite)
                            Text(shortTicketInfo.arrival.airport.rawValue)
                                .foregroundStyle(.dGrey6)
                        }
                        .italic()
                        .frame(width: 40)
                        
                        Spacer()
                        Text("\(calculateDuration())ч в пути / \(shortTicketInfo.hasTransfer  == false ? "Без пересадок" : "С пересадками")")
                            .foregroundStyle(.dWhite)
                            .lineLimit(1)
                            .padding(.leading, 16)
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
            if ((shortTicketInfo.badge?.isEmpty) == nil) {}
            else {
                Text(shortTicketInfo.badge ?? "Рекомендуемый")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 50)
                        .fill(.dBlue))
                    .foregroundStyle(.dWhite)
                    .font(.system(size: 14))
                    .italic()
                    .offset(x: 0, y: -9)
            }
        }
    }
    
    private func extractTime(from isoDateString: String) -> String? {
        let isoDateFormatter = ISO8601DateFormatter()
        
        if let date = isoDateFormatter.date(from: isoDateString) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            
            let timeString = timeFormatter.string(from: date)
            
            return timeString
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            if let date = dateFormatter.date(from: isoDateString) {
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "HH:mm"
                
                let timeString = timeFormatter.string(from: date)
                return timeString
            } else {
                return nil
            }
        }
    }
    
    private func calculateDuration() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let departureDate = dateFormatter.date(from: shortTicketInfo.departure.date) else {
            print("Failed to parse departure date")
            return ""
        }
        guard let arrivalDate = dateFormatter.date(from: shortTicketInfo.arrival.date) else {
            print("Failed to parse arrival date")
            return ""
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: departureDate, to: arrivalDate)
        
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        return String(format: "%02d:%02d", hours, minutes)
    }
}

//#Preview {
//    ShortTicketInfoView()
//}
