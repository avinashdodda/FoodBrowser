//
//  View+Ext.swift
//  FoodBrowser
//
//  Created by Avinash Dodda on 8/14/21.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
