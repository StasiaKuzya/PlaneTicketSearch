//
//  HScrollViewFullSearchScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct FiltersView: View {
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                Button {
                    //TODO:
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                            .renderingMode(.template)
                            .foregroundStyle(.dWhite)
                        Text("обратно")
                    }
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 10)
                    .background(.dGrey3)
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
                                
                Button {
                    showDatePicker.toggle()
                } label: {
                    Text(dateFormat(date: selectedDate))
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 10)
                        .background(.dGrey3)
                        .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
                .popover(isPresented: $showDatePicker) {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                Button {
                    //TODO:
                } label: {
                    HStack(spacing: 8) {
                        Image("profile")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.dWhite)
                            .frame(width: 16, height: 16)
                        Text("1, эконом")
                    }
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 10)
                    .background(.dGrey3)
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
                
                Button {
                    //TODO:
                } label: {
                    HStack(spacing: 8) {
                        Image("filters")
                            .renderingMode(.template)
                            .foregroundStyle(.dWhite)
                        Text("фильтры")
                    }
                    .padding([.top, .bottom], 8)
                    .padding([.leading, .trailing], 10)
                    .background(.dGrey3)
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
            }
            .italic()
            .font(.system(size: 14, weight: .regular))
            .frame(height: 33)
        }
        .background(.dBlack)
        .foregroundStyle(.dWhite)
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM, E"
        return formatter.string(from: date)
    }
}

#Preview {
    FiltersView()
}
