//
//  CategoryMealsView.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import SwiftUI

struct CategoryMealsView: View {
    let category: Category
    @StateObject private var viewModel: CategoryMealsViewModel
    
    init(viewModel: CategoryMealsViewModel? = nil, category: Category) {
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
        .navigationTitle(category.name)
        .navigationDestination(for: Meal.self) { meal in
            MealDetailView(mealID: meal.id)
        }
        .onAppear {
            viewModel.getAllCategoryMeals(category: category.name)
        }
        
    }
}

#Preview {
    let vm = CategoryMealsViewModel(service: MockFoodService())
    CategoryMealsView(
        viewModel: vm,
        category: Category(id: "1", name: "1", image: "", desc: "")
    )

}
