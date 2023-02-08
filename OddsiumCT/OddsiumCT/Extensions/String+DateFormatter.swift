//
//  Date+Format.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-07.
//

import Foundation

extension String {
    func dateFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = dateFormatter.date(from: self) else { return "n/a" }
        
        dateFormatter.dateFormat = "E, MMM d, HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
