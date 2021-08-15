//
//  FoodItemRow.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import SwiftUI

struct FoodItemRow: View {
    var foodItem: FoodItemSummary
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(foodItem.name)
                        .font(.title3)
                        .foregroundColor(.black)
                    Text(foodItem.brand)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 17, height: 17, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            HStack {
                Text("Calories: \(foodItem.calories)")
                    .font(.footnote)
                Spacer()
                Text("Serving Size: \(foodItem.portion) gms")
                    .font(.footnote)
            }
            .foregroundColor(Color(.systemGray))
            Divider()
        }
        .padding(.horizontal)
    }
}

struct FoodItemRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemRow(foodItem: FoodItemSummary(id: 1,
                                              brand: "Starbucks",
                                              name: "Chicken Alfredo",
                                              calories: 873,
                                              portion: 414))
    }
}
