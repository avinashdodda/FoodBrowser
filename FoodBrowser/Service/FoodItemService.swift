//
//  FoodService.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import Foundation
import Combine

enum FoodItemError: Error {
    case invalidURL
    case networkError
    case other(Error)
    
    static func map(_ error: Error) -> FoodItemError {
        return (error as? FoodItemError) ?? .other(error)
    }
}

enum FoodAPIResources: String {
    case search
}

final class FoodItemService {
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "uih0b7slze.execute-api.us-east-1.amazonaws.com"
        urlComponents.path = "/dev/\(FoodAPIResources.search.rawValue)"
        return urlComponents
    }
    
    
    func foodItems(parameters: [String: String]) throws -> AnyPublisher<[FoodItemSummary], FoodItemError> {
        var urlComponents = self.urlComponents
        urlComponents.setQueryItems(with: parameters)
        guard let url = urlComponents.url else {
            throw FoodItemError.invalidURL
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { output in
                guard (output.response as? HTTPURLResponse)?.statusCode == 200
                else { throw FoodItemError.networkError }
                return output.data
            }
            .decode(type: [FoodItemSummary].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError{ FoodItemError.map($0) }
            .eraseToAnyPublisher()
    }
    
    
}
