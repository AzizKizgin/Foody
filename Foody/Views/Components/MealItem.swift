//
//  MealItem.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import SwiftUI

import SwiftUI

struct MealItem: View {
    let meal: Meal

    var body: some View {
        let fixedUrl = meal.image?.replacingOccurrences(of: "\\/", with: "/")

        VStack(spacing: 0) {
            AsyncImage(url: URL(string: fixedUrl ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipped()
                default:
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
            }

            Text(meal.name)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .lineLimit(1)
            HStack {
                Text("\(meal.name.count)$")
                    .padding(5)
                Spacer()
                Button("", systemImage: "plus.circle.fill") {
                    
                }
                .font(.title)
            }
            .padding(5)
        }
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(10)
    }
}


#Preview {
    MealItem(
        meal: Meal(
            id: "1",
            name: "1"
        )
    )
}
