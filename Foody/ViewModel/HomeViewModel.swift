//
//  HomeViewModel.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private let service: FoodServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: FoodServiceProtocol) {
        self.service = service
    }
    
    func getAllCategories() {
        self.isLoading = true
        service.getAllCategories()
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
                self?.categories = value.categories
            }
            .store(in: &cancellables)
    }
    
    private func setError(_ error:String) {
        self.showError = true
        self.errorMessage = error
    }
}
