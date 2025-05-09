//
//  MealDetailView.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel: MealDetailViewModel
    let mealID: String

    init(viewModel: MealDetailViewModel? = nil, mealID: String) {
        self.mealID = mealID
        if let viewModel = viewModel {
            _viewModel = StateObject(wrappedValue: viewModel)
        } else {
            let service = DIContainer.shared.container.resolve(FoodServiceProtocol.self)!
            _viewModel = StateObject(wrappedValue: MealDetailViewModel(service: service))
        }
    }

    var body: some View {
        let meal = viewModel.meal

        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Meal Image
                let fixedUrl = meal.image?.replacingOccurrences(of: "\\/", with: "/")
                AsyncImage(url: URL(string: fixedUrl ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(16)
                    default:
                        Image("placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(16)
                    }
                }

                // Ingredients Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)

                    ForEach(meal.getIngredients()) { item in
                        HStack(alignment: .top) {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                            Text(item.name)
                                .font(.body)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle(meal.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getMeal(id: mealID)
        }
    }
}


#Preview {
    let vm = MealDetailViewModel(service: MockFoodService())
    NavigationStack {
        MealDetailView(viewModel: vm, mealID: "52772")
    }
}
