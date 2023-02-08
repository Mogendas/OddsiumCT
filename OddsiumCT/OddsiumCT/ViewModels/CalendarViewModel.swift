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
        let apiService = APIService()
        
        Task {
            do {
                let test = try await apiService.getMatches(for: Date())
                
                self.matches = test?.data.matches ?? []
                
            } catch {
                print("Error: \(error)")
            }
        }
        
    }
}
