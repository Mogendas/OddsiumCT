//
//  CalendarViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

@MainActor class CalendarViewModel: ObservableObject {
    @Published private(set) var dates = [Date]()
    @Published private(set) var selectedMatches = [MatchModel]()
    @Published var selectedDate = Date() {
        didSet {
            selectedMatches = matches.filter({ $0.date.contains(selectedDate.dateAsString)})
        }
    }
    
    private var matches = [MatchModel]()
    private let numberOfDays = 4
    
    init() {
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return }
        
        for i in 0..<numberOfDays {
            if let newDate = Calendar.current.date(byAdding: .day, value: i, to: yesterday) {
                dates.append(newDate)
            }
        }
        loadMatches()
    }
    
    private func loadMatches() {
        let apiService = APIService()
        matches = [MatchModel]()
        
        dates.forEach { date in
            Task {
                do {
                    let newMatches = try await apiService.getMatches(for: date)
                    
                    self.matches.append(contentsOf: newMatches?.data.matches ?? [])
                    
                    selectedMatches = matches.filter({ $0.date.contains(selectedDate.dateAsString)})
                    
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}
