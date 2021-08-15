//
//  ContentView.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/13/21.
//

import SwiftUI

struct FoodBrowser: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @StateObject private var viewModel = FoodItemViewModel()
    
    init() {
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText,
                          isSearching: $isSearching,
                          viewModel: viewModel)
                ForEach(viewModel.items, id :\.id) { foodItem in
                    NavigationLink(destination: FoodItemDetail(foodItem: foodItem))  {
                        FoodItemRow(foodItem: foodItem)
                    }
                }
            }
            .navigationTitle("Food Browser")
            .navigationBarItems(trailing:
                                    Button("Clear") {
                                        viewModel.clearItemList()
                                    })
            .alert(isPresented: $viewModel.isEmptyResponse) {
                Alert(
                    title: Text("Unable to seach food item"),
                    message: Text("Please enter another food item and try again"),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodBrowser()
    }
}
