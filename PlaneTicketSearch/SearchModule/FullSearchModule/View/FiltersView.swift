//
//  HScrollViewFullSearchScreen.swift
//  PlaneTicketSearch
//
//  Created by Анастасия on 28.05.2024.
//

import SwiftUI

struct FiltersView: View {
    @State private var selectedDate = Date()
    @State private var returnDate = Date()
    @State private var showDepartDatePicker = false
    @State private var showReturnDatePicker = false
    @ObservedObject var dateViewModel: DateViewModel = .init()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                Button {
                    showReturnDatePicker.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                            .renderingMode(.template)
                            .foregroundStyle(.dWhite)
                        
                        let calendar = Calendar.current
                        let departureDate = calendar.startOfDay(for: dateViewModel.selectedDate)
                        let returningDate = calendar.startOfDay(for: returnDate)
                        if returningDate > departureDate {
                            Text(dateFormat(date: returnDate))
                        } else {
                            Text("обратно")
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(.dGrey3)
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
                .popover(isPresented: $showReturnDatePicker) {
                    DatePicker("", selection: $returnDate, in: dateViewModel.selectedDate..., displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                                
                Button {
                    showDepartDatePicker.toggle()
                } label: {
                    Text(dateFormat(date: dateViewModel.selectedDate))
                        .padding(.vertical, 8)
                        .padding([.leading, .trailing], 10)
                        .background(.dGrey3)
                        .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
                .popover(isPresented: $showDepartDatePicker) {
                    DatePicker("", selection: $dateViewModel.selectedDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .environmentObject(dateViewModel)
                
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
                    .padding(.vertical, 8)
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
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
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
