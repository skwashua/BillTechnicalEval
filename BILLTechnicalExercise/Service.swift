//
//  Service.swift
//  BILLTechnicalExercise
//
//  Created by Joshua Lytle on 12/14/22.
//

import Foundation
import Combine

struct Service {
    enum BillError: Error {
        case invalidURL
        case invalidResponse
        case statusCode(Int)
    }
    
    enum Endpoint: String {
        case business = "https://raw.githubusercontent.com/DivvyPayHQ/BusinessIntelligence/master/data.json"
    }
    
    var session: URLSession = URLSession.shared
    
    func get(endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: endpoint.rawValue) else {
            return Fail(error: BillError.invalidURL).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        return session.dataTaskPublisher(for: request)
            .mapError({ error -> URLError in
                return error
            })
            .tryMap { try validate($0.data, $0.response) }
            .eraseToAnyPublisher()
    }
    
    private func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw BillError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw BillError.statusCode(httpResponse.statusCode)
        }
        
        return data
    }
}
