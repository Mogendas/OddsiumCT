//
//  Date+Format.swift
//  OddsiumCT
//
//  Created by Johan Wejdenstolpe on 2023-02-08.
//

import Foundation

extension Date {
    var dateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: self)
    }
}
