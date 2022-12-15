//
//  BusinessDetailView.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/15/22.
//

import SwiftUI
import Charts

struct BusinessDetailView: View {
    var business: Business
    
    var body: some View {
        ScrollView {
            VStack {
                Chart {
                    ForEach(business.revenue) { revenuePoint in
                        LineMark(x: .value(revenuePoint.dateValue, revenuePoint.date!),
                                 y: .value("value", revenuePoint.value))
                    }
                }
                .frame(height: 300)
                VStack {
                    ForEach(business.revenue) { revenuePoint in
                        HStack {
                            Text(revenuePoint.shordDate ?? "")
                            Spacer()
                            Text(revenuePoint.formattedValue ?? "")
                        }
                        Divider()
                            .padding(.bottom, 4)
                    }
                }
            }
            .padding()
            .navigationTitle(business.name)
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(business: Business(id: 0, name: "test", location: Location(address: "address", city: "city", country: "country"), revenue: []))
    }
}
