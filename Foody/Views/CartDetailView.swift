//
//  CartDetailView.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import SwiftUI

struct CartDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing:20) {
                
                ForEach(cartManager.items.keys.sorted(by: { $0.name < $1.name }), id: \.id) { meal in
                    if let count = cartManager.items[meal] {
                        CartMealItem(
                            meal: meal,
                            count: count,
                            price: Double(meal.name.count),
                            onIncrease: { cartManager.addToCart(item: meal) },
                            onDecrease: { cartManager.removeFromCart(item: meal) }
                        )
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Total Price: \((cartManager.totalPrice).formatted(.currency(code: "usd")))")
                        .font(.title2)
                        .padding(.top)
                }
                .padding()
                Button {
                    cartManager.buy()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        dismiss()
                    }
                } label: {
                    Text("Checkout")
                        .font(.title2)
                        .padding(10)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .alert(
                    "We received your order",
                    isPresented: $cartManager.showSuccess) {
                        Button("OK") {
                        }
                    }
                
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var cartManager = CartManager()
   
    CartDetailView()
        .environmentObject(cartManager)
        .onAppear {
            cartManager.addToCart(item: Meal(id: "1", name: "Burger"))
            cartManager.addToCart(item: Meal(id: "1", name: "Burger"))
            cartManager.addToCart(item: Meal(id: "2", name: "Pizza"))
            cartManager.addToCart(item: Meal(id: "3", name: "Pasta"))
        }
}

