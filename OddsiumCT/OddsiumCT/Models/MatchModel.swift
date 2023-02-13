//
//  MatchModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation
import SwiftUI

struct MatchModel: Codable, Identifiable {
    let id: Int
    let name: String
    let date: String
    let tournamentId: Int
    let tournamentName:String
    let tournamentFlagUrl: String
    let status: String
    let liveStatus: String
    let htName: String
    let htId: Int
    let htFlagUrl: String
    let atName: String
    let atId: Int
    let atFlagUrl: String
    let score: Score
    
    private enum CodingKeys : String, CodingKey {
        case id, name, date, status, score
        case tournamentId = "tournament_id"
        case tournamentName = "tournament_name"
        case tournamentFlagUrl = "tournament_flag_url"
        case liveStatus = "live_status"
        case htName = "ht_name"
        case htId = "ht_id"
        case htFlagUrl = "ht_flag_url"
        case atName = "at_name"
        case atId = "at_id"
        case atFlagUrl = "at_flag_url"
    }
}

class Selection {
    let date: Date
    var isSelected: Bool
    
    init(date: Date, isSelected: Bool) {
        self.date = date
        self.isSelected = isSelected
    }
}
