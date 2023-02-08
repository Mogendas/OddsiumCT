//
//  MatchViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

@MainActor class MatchViewModel: ObservableObject {
    @Published var match: MatchModel
    
    init(match: MatchModel) {
        self.match = match
    }
}
