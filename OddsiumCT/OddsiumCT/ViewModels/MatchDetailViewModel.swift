//
//  MatchDetailViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-08.
//

import Foundation

@MainActor class MatchDetailViewModel: ObservableObject {
    @Published var matchDetails: MatchDetailModel?
    
    init(matchId: Int) {
        loadMatchInfo(matchId: matchId)
    }
    
    private func loadMatchInfo(matchId: Int) {
        let apiService = APIService()
        
        Task {
            do {
                let test = try await apiService.getMatchDetails(for: matchId)
                
                self.matchDetails = test?.data
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
