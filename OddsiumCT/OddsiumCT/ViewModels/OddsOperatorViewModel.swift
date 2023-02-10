//
//  OddsOperatorViewModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-10.
//

import Foundation

@MainActor class OddsOperatorViewModel: ObservableObject {
    @Published var operatorOdds: OperatorOdds
    
    init(operatorOdds: OperatorOdds) {
        self.operatorOdds = operatorOdds
    }
    
    var operatorImage: String {
        return "http://zeus.oddsium.com/i/\(operatorOdds.operatorFlagUrl)"
    }
}
