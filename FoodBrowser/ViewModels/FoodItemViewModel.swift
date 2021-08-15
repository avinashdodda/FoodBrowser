//
//  FoodItemViewModel.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import Foundation
import Combine

final class FoodItemViewModel: ObservableObject {
    private enum Constants {
        static let queryKey = "kv"
    }
    
    @Published var items = [FoodItemSummary]()
    @Published var isEmptyResponse = false
    private(set) var service: FoodItemService
    private(set) var cancellable = Set<AnyCancellable>()
    
    init(service: FoodItemService = FoodItemService()) {
        self.service = service
    }
    
    func searchFoodItems(queryValue: String) {
        do {
            try service.foodItems(parameters: [Constants.queryKey : queryValue])
                .sink { completion in
                    if case .failure = completion {
                        print(completion)
                    }
                } receiveValue: { [weak self] items in
                    guard let self = self else { return }
                    if !items.isEmpty {
                        self.items = items
                    } else {
//                        self.isEmptyResponse = true
                    }
                }
                .store(in: &cancellable)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clearItemList() {
        self.items = []
    }
}
