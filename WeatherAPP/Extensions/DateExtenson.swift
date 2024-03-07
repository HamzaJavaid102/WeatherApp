//
//  DateExtenson.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import Foundation

extension Date {
    
    func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, dd"
        dateFormatter.locale = .current
        
        return dateFormatter.string(from: self)
    }
    
    func formattedHourString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh a"
        dateFormatter.locale = .current
        
        return dateFormatter.string(from: self)
    }
}
