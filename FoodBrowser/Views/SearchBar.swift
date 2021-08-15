//
//  SearchBar.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/13/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var viewModel: FoodItemViewModel
    
    // SearchBar
    var body: some View {
        HStack {
            HStack {
                TextField("Enter 3 or more characters", text: $searchText)
                    .padding(.leading, 40)
                    .onChange(of: searchText) { text in
                        if text.count >= 3 {
                            viewModel.searchFoodItems(queryValue: searchText)
                        }
                    }
            }
            .padding(.vertical, 12)
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                searchBarViews
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                cancelButton
            }
            
        }
        .padding(.vertical)
    }
    
    // Views for magnifying glass and clear button in Search bar
    var searchBarViews: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Spacer()
            
            if isSearching {
                Button(action: { searchText = "" }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.vertical)
                })
                
            }
            
        }.padding(.horizontal, 32)
        .foregroundColor(.gray)
    }
    
    // Cancel button
    var cancelButton: some View {
        Button(action: {
            isSearching = false
            searchText = ""
            
            hideKeyboard()
            
        }, label: {
            Text("Cancel")
                .padding(.trailing)
                .padding(.leading, 0)
        })
        .transition(.move(edge: .trailing))
        .animation(.spring())
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""),
                  isSearching: .constant(false),
                  viewModel: FoodItemViewModel())
    }
}
