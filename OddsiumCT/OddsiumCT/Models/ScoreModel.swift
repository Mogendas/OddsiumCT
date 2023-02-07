//
//  ScoreModel.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-06.
//

import Foundation

struct Score: Codable {
    let htScore: String
    let atScore: String
    let scoreDetails: String
    
    private enum CodingKeys : String, CodingKey {
        case htScore = "ht_score"
        case atScore = "at_score"
        case scoreDetails = "score_details"
    }
}
