//
//  RevenuePoint.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import Foundation

struct RevenuePoint: Codable {
    var seq: Int
    var value: Double
    var dateValue: String
    
    var date: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.date(from: dateValue)
    }
    
    var shordDate: String? {
        guard let date = date else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    var formattedValue: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: value as NSNumber)
    }

    
    enum CodingKeys: String, CodingKey {
        case dateValue = "date"
        case seq, value
    }
}

extension RevenuePoint: Identifiable {
    var id: Int { return seq }
}
