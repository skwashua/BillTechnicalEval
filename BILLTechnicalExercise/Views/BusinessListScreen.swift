//
//  BusinessListScreen.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import SwiftUI

struct BusinessListScreen: View {
    @StateObject var viewModel = BusinessViewModel()
    @State var selectedBusiness: Business?
    @State private var path: [Business] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.businesses.sorted(by: { $0.lastRevenueValue > $1.lastRevenueValue
            })) { business in
                NavigationLink(value: business) {
                    BusinessRow(business: business)
                }
            }
            .navigationDestination(for: Business.self) { business in
                BusinessDetailView(business: business)
            }
            .listStyle(.inset)
            .navigationTitle("BILL")
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

struct BusinessRow: View {
    var business: Business
    
    var body: some View {
        HStack(spacing: 0) {
            Text(business.name)
                .font(.headline)
            Spacer()
            Text("$\(Int(business.lastRevenueValue))")
        }
        .padding(.vertical, 4)
    }
}

struct BusinessListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BusinessListScreen()
    }
}
