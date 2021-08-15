//
//  FoodItemDetail.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import SwiftUI

struct FoodItemDetail: View {
    
    var foodItem: FoodItemSummary
    
    var body: some View {
        Text(foodItem.name)
            .font(.title)
            .navigationTitle("Detail")
    }
}

struct FoodItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemDetail(foodItem: FoodItemSummary(id: 1,
                                                 brand: "Starbucks",
                                                 name: "Chicken Alfredo",
                                                 calories: 873,
                                                 portion: 414))
    }
}
