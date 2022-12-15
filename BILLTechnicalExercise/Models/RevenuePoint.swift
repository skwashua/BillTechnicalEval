//
//  RevenuePoint.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import Foundation

struct RevenuePoint: Codable {
    var seq: Int
    lazy var date: Date? = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.date(from: dateValue)
    }()
    var value: Double
    var dateValue: String
    
    enum CodingKeys: String, CodingKey {
        case dateValue = "date"
        case seq, value
    }
}

extension RevenuePoint: Identifiable {
    var id: Int { return seq }
}
