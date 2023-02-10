//
//  MatchDetailModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-08.
//

import SwiftUI

struct MatchDetailModel: Codable, Identifiable {
    let id: Int
    let name: String
    let date: String
    let sportId: Int
    let tournamentId: Int
    let tournamentName: String
    let tournamentFlagUrl: String
    let status: String
    let liveStatus: String
    let progressBar: String
    let htName: String
    let htId: Int
    let htFlagUrl: String
    let atName: String
    let atId: Int
    let atFlagUrl: String
    let h2hHomePosition: String
    let h2hHomePositionChange: String
    let h2hAwayPosition: String
    let h2hAwayPositionChange: String
    let h2hHomeWins: String
    let h2hAwayWins: String
    let h2hDraws: String
    let h2hHomeWinsRate: String
    let h2hAwayWinsRate: String
    let h2hDrawsRate: String
    let tournamentStartDate: String
    let tournamentEndDate: String
    let score: Score
    let oddsFormatName: String
    let oddsFormatId: Int
    let submarketName: String
    let submarketId: Int
    let oddsName: [OddsName]?
    let operatorOdds: [OperatorOdds]?
    
    private enum CodingKeys : String, CodingKey {
        case id, name, date, status, score
        case sportId = "sport_id"
        case tournamentId = "tournament_id"
        case tournamentName = "tournament_name"
        case tournamentFlagUrl = "tournament_flag_url"
        case liveStatus = "live_status"
        case progressBar = "progress_bar"
        case htName = "ht_name"
        case htId = "ht_id"
        case htFlagUrl = "ht_flag_url"
        case atName = "at_name"
        case atId = "at_id"
        case atFlagUrl = "at_flag_url"
        case h2hHomePosition = "h2h_home_position"
        case h2hHomePositionChange = "h2h_home_position_change"
        case h2hAwayPosition = "h2h_away_position"
        case h2hAwayPositionChange = "h2h_away_position_change"
        case h2hHomeWins = "h2h_home_wins"
        case h2hAwayWins = "h2h_away_wins"
        case h2hDraws = "h2h_draws"
        case h2hHomeWinsRate = "h2h_home_wins_rate"
        case h2hAwayWinsRate = "h2h_away_wins_rate"
        case h2hDrawsRate = "h2h_draws_rate"
        case tournamentStartDate = "tournament_start_date"
        case tournamentEndDate = "Tournament_end_date"
        case oddsFormatName = "odds_format_name"
        case oddsFormatId = "odds_format_id"
        case submarketName = "submarket_name"
        case submarketId = "submarket_id"
        case oddsName = "odds_name"
        case operatorOdds = "operator_odds"
    }
}

struct OddsName: Codable {
    let name: String
}

struct OperatorOdds: Codable, Identifiable {
    let id = UUID()
    let operatorName: String
    let operatorId: Int
    let operatorFlagUrl: String
    let isOpen: Bool
    let operatorMatchId: String
    let operatorTournamentId: String
    let odds: [Odds]
    
    private enum CodingKeys : String, CodingKey {
        case odds
        case operatorName = "operator_name"
        case operatorId = "operator_id"
        case operatorFlagUrl = "operator_flag_url"
        case isOpen = "is_open"
        case operatorMatchId = "operator_match_id"
        case operatorTournamentId = "operator_tournament_id"
    }
}

struct Odds: Codable, Identifiable {
    let id = UUID()
    let oddsValue: String
    let oddsId: String
    let oddsValueReq: String
    
    private enum CodingKeys : String, CodingKey {
        case oddsValue = "odds_value"
        case oddsId = "odds_id"
        case oddsValueReq = "odds_value_req"
    }
}

struct MatchDetailData: Codable {
    let data: MatchDetailModel
}
