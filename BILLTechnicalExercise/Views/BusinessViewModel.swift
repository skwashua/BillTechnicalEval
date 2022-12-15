//
//  BusinessRepository.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import Foundation
import Combine

class BusinessViewModel: ObservableObject {
    @Published var businesses: [Business] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        businesses = []
        Service().get(endpoint: .business)
            .decode(type: [Business].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { result in
                print("Fetched busineeses \(result)")
            } receiveValue: { [unowned self] data in
                self.businesses = data
            }
            .store(in: &cancellables)
    }
}
