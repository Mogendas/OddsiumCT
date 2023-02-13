//
//  CalendarViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import SwiftUI

@MainActor class CalendarViewModel: ObservableObject {
    @Published var selections = [Selection]()
    @Published private(set) var selectedMatches = [MatchModel]()
    @Published var selectedDate = Date() {
        didSet {
            for selection in selections {
                selection.isSelected = false
            }
            
            selections.first(where: { $0.date.dateAsString == selectedDate.dateAsString })?.isSelected = true
            
            selectedMatches = matches.filter({ $0.date.contains(selectedDate.dateAsString) })
            selections.forEach { selection in
                print("\(selection.date.dateAsString), \(selection.isSelected)")
            }
        }
    }
    
    private var matches = [MatchModel]()
    private let numberOfDays = 4
    
    init() {
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return }
        
        for i in 0..<numberOfDays {
            if let newDate = Calendar.current.date(byAdding: .day, value: i, to: yesterday) {
                selections.append(Selection(date: newDate, isSelected: newDate.dateAsString == selectedDate.dateAsString ))
//                dates.append(newDate)
            }
        }
        loadMatches()
    }
    
    private func loadMatches() {
        let apiService = APIService()
        matches = [MatchModel]()
        
        selections.forEach { selection in
            Task {
                do {
                    let newMatches = try await apiService.getMatches(for: selection.date)
                    
                    self.matches.append(contentsOf: newMatches?.data.matches ?? [])
                    
                    selectedMatches = matches.filter({ $0.date.contains(selectedDate.dateAsString)})
                    
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
//    func filterSelections() {
//        for selection in selections {
//            selection.isSelected = false
//        }
//        let newSelection = selections.first(where: { $0.date.dateAsString == selectedDate.dateAsString })
//        selectedMatches = matches.filter({ $0.date.contains(selectedDate.dateAsString)})
//    }
}
