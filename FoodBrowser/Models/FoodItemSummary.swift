//
//  FoodSummary.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

struct FoodItemSummary: Decodable {
    let id: Int
    let brand: String
    let name: String
    let calories: Int
    let portion: Int
}
