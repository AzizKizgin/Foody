//
//  CartMealItem.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import SwiftUI

struct CartMealItem: View {
    let meal: Meal
    let count: Int
    let price: Double
    let onIncrease: () -> Void
    let onDecrease: () -> Void
    var body: some View {
        VStack(alignment:.leading) {
            HStack(spacing:30) {
                let fixedUrl = meal.image?.replacingOccurrences(of: "\\/", with: "/")
                AsyncImage(url: URL(string: fixedUrl ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .clipped()
                    default:
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .clipped()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                Text(meal.name)
                    .multilineTextAlignment(.leading)
                
            }
            HStack {
                Button {
                    onIncrease()
                } label: {
                    Image(systemName: "plus")
                        .frame(height: 20)
                }
                .buttonStyle(.borderedProminent)
                Text("\(count)")
                Button {
                    onDecrease()
                } label: {
                    Image(systemName: "minus")
                        .frame(height: 20)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Text(
                    "Total: \((price * Double(count)).formatted(.currency(code: "usd")))"
                )

            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(10)
    }
}

#Preview {
    CartMealItem(meal: Meal(id: "1", name: "Burger"), count: 4, price: 12,
                 onIncrease: {}, onDecrease: {})
}
