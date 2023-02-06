//
//  MatchModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

struct MatchModel {
    let id: Int
    let name: String
    let date: String
    let tournament_id: Int
    let tournament_name:String
    let tournament_flag_url: String
    let status: String
    let live_status: String
    let ht_name: String
    let ht_id: Int
    let ht_flag_url: String
    let at_name: String
    let at_id: Int
    let at_flag_url: String
    let score: Score
}
