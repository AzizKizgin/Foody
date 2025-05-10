//
//  CartManager.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import Foundation

class CartManager: ObservableObject {
    @Published var showSuccess: Bool = false
    @Published var items: [Meal: Int] = [:]
    var totalCount: Int {
        items.values.reduce(0, +)
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + (Double($1.key.name.count) * Double($1.value)) }
    }
    
    func addToCart(item: Meal) {
        if let currentCount = items[item] {
            items[item] = currentCount + 1
        } else {
            items[item] = 1
        }
    }
    
    func removeFromCart(item: Meal) {
        if let currentCount = items[item], currentCount > 1 {
            items[item] = currentCount - 1
        } else {
            items.removeValue(forKey: item)
        }
    }
    
    func clearAll() {
        items.removeAll()
    }
   
    func buy() {
        showSuccess = true
        clearAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showSuccess = false
        }
    }
}


