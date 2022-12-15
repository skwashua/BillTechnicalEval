//
//  Business.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import Foundation

struct Business: Decodable, Identifiable {
    var id: Int
    var name: String
    var location: Location
    var revenue: [RevenuePoint] = []
    var lastRevenueValue: Double {
        return revenue.first?.value ?? 0.0
    }
}

extension Business: Hashable {
    static func == (lhs: Business, rhs: Business) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
