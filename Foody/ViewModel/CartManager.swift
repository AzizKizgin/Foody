//
//  CartManager.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import Foundation

class CartManager: ObservableObject {
    @Published var showSuccess: Bool = false
    @Published var items: Set<Meal> = Set()
    var totalCount: Int {
        items.count
    }

    var totalPrice: Double {
        Double(items.reduce(0) { $0 + $1.name.count })
    }
    
    func addToCart(item: Meal) {
        items.insert(item)
    }
    
    func removeFromCart(item: Meal) {
        items.remove(item)
    }
    
    func clearAll() {
        items.removeAll()
    }
    
    func buy() {
        DispatchQueue.main.async {
            self.showSuccess = true
            self.clearAll()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showSuccess = false
            }
        }
    }
}
