//
//  CategoryMealsView.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import SwiftUI

struct CategoryMealsView: View {
    let category: String
    @StateObject private var viewModel: CategoryMealsViewModel
    
    init(viewModel: CategoryMealsViewModel? = nil, category: String) {
        self.category = category
        if let viewModel = viewModel {
            _viewModel = StateObject(wrappedValue: viewModel)
        } else {
            let service = DIContainer.shared.container.resolve(
                FoodServiceProtocol.self
            )!
            _viewModel = StateObject(wrappedValue: CategoryMealsViewModel(service: service))
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 8) {
                    ForEach(viewModel.meals) { meal in
                        NavigationLink(value: meal) {
                            MealItem(meal: meal)
                        }
                    }
                }
            }
            .navigationDestination(for: Meal.self) { meal in
                
            }
            .onAppear {
                viewModel.getAllCategoryMeals(category: category)
            }
        }
    }
}

#Preview {
    let vm = CategoryMealsViewModel(service: MockFoodService())
    CategoryMealsView(viewModel: vm, category: "Beef")

}
