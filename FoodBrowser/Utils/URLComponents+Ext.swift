//
//  URLComponents+Ext.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
