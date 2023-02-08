//
//  CalendarViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

@MainActor class CalendarViewModel: ObservableObject {
    @Published private(set) var matches = [MatchModel]()
    
    init() {
        loadMatches()
    }
    
    private func loadMatches() {
        guard let data = dummyData.data(using: .utf8),
              let newData = try? JSONDecoder().decode(MatchData.self, from: data) else { return }
        self.matches = newData.data.matches
    }
}
