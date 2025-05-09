//
//  CategoryMealsViewModel.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import Foundation
import Combine

class CategoryMealsViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private let service: FoodServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: FoodServiceProtocol) {
        self.service = service
    }
    
    func getAllCategoryMeals(category: String) {
        self.isLoading = true
        service.getMealsByCategory(category: category)
            .handleEvents(receiveCompletion: { [weak self] _ in
                print(0)
                self?.isLoading = false
            })
            .sink { [weak self] result in
                guard let self = self else { return }
                print(1)
                if case let .failure(error) = result {
                    self.setError(error.localizedDescription)
                }
            } receiveValue: { [weak self] value in
                print(2)
                self?.meals = value.meals
            }
            .store(in: &cancellables)
    }
    
    private func setError(_ error:String) {
        self.showError = true
        self.errorMessage = error
    }
}
