//
//  RegisterViewModel.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var info: RegisterDto = RegisterDto()
    @Published var shouldRemember: Bool = false
    @Published var isChecked: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private let service: AuthServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func register(completion: @escaping (User?) -> Void) {
        self.isLoading = true
        service.register(info: info)
            .sink { [weak self] result in
                guard let self = self else { return }
                self.isLoading = false
                if case let .failure(error) = result {
                    self.setError(error.localizedDescription)
                    completion(nil)
                }
            } receiveValue: { [weak self] value in
                self?.isLoading = false
                completion(value)
            }
            .store(in: &cancellables)
    }

    
    private func setError(_ error:String) {
        self.showError = true
        self.errorMessage = error
    }
}
