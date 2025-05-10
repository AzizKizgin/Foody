//
//  ToolbarCart.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import SwiftUI

struct ToolbarCart: ViewModifier {
    @EnvironmentObject var cartManager: CartManager
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Handle cart tap action
                    }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: cartManager.items.isEmpty ? "cart" : "cart.fill")
                                .font(.title2)

                            if !cartManager.items.isEmpty {
                                Text("\(cartManager.items.count)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                }
            }
    }
}

extension View {
    func toolbarCart() -> some View {
        self.modifier(ToolbarCart())
    }
}


#Preview {
    NavigationStack {
        Text("ss")
    }
}
