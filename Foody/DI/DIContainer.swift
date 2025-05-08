//
//  DIContainer.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Swinject


class DIContainer {
    static let shared = DIContainer()
    let container = Container()
    
    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        container.register(AuthServiceProtocol.self) { _ in
            AuthService()
        }
    }
}
