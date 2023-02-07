//
//  Matches.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

struct Matches: Codable {
    let identifier: String
    let matches: [MatchModel]
}


struct MatchData: Codable {
    let data: Matches
}
