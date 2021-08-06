//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 4.07.2021.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter       = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
