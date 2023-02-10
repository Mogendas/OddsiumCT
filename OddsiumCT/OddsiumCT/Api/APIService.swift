//
//  APIService.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-08.
//

import Foundation

enum APIError: Error {
    case runtimeError(String)
}

final class APIService {
    
    let baseUrl = "https://psydreus.oddsium.com/"
    
    func getMatchDetails(for matchId: Int) async throws -> MatchDetailData? {
        guard let countrycode = Locale.current.language.region?.identifier else { return nil }
        
        let urlString = "\(baseUrl)match?submarket=1&match=\(matchId)&countrycode=\(countrycode)&oddstype=1"
        guard let url = URL(string: urlString) else { throw APIError.runtimeError("URL error") }
        
        let data = try await sendRequest(url: url)
        
        return try JSONDecoder().decode(MatchDetailData.self, from: data)
    }
    
    func getMatches(for date: Date) async throws -> MatchData? {
        guard let countrycode = Locale.current.language.region?.identifier else { return nil }
        let timeZone = TimeZone.current.identifier
        
        let urlString = "\(baseUrl)matches?date=\(date.dateAsString)&sport=1&countrycode=\(countrycode)&timezone=\(timeZone)"
        guard let url = URL(string: urlString) else { throw APIError.runtimeError("URL error") }

        let data = try await sendRequest(url: url)
        
        return try JSONDecoder().decode(MatchData.self, from: data)
    }
    
    
    private func sendRequest(url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
}
