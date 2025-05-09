//
//  MealDetailViewModel.swift
//  Foody
//
//  Created by Aziz Kızgın on 10.05.2025.
//

import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    @Published var meal:  Meal = Meal()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private let service: FoodServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: FoodServiceProtocol) {
        self.service = service
    }
    
    func getMeal(id: String) {
        self.isLoading = true
        service.getMealByID(id: id)
            .handleEvents(receiveCompletion: { [weak self] _ in
                
                self?.isLoading = false
            })
            .sink { [weak self] result in
                guard let self = self else { return }
               
                if case let .failure(error) = result {
                    self.setError(error.localizedDescription)
                }
            } receiveValue: { [weak self] value in
                self?.meal = value.meals.first ?? Meal()
            }
            .store(in: &cancellables)
    }
    
    private func setError(_ error:String) {
        self.showError = true
        self.errorMessage = error
    }
}
