//
//  AuthService.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

class AuthService: AuthServiceProtocol {
    func register(info: RegisterDto) -> AnyPublisher<User, any Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if info.email.contains("@") || info.password.isEmpty{
                    let user = User(name: "User", email: info.email)
                    promise(.success(user))
                } else {
                    promise(.failure(AuthErrors.loginFail("Invalid email or password")))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func login(info: LoginDto) -> AnyPublisher<User, any Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if info.email.contains("@") || info.password.isEmpty {
                    let user = User(name: "User", email: info.email)
                    promise(.success(user))
                } else {
                    promise(.failure(AuthErrors.registerFail("Invalid email or password")))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func resetPassword(email: String) -> AnyPublisher<String, any Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if email.contains("@") {
                    promise(.success("Password reset link sent to \(email)"))
                } else {
                    promise(.failure(AuthErrors.invalidEmail("Invalid email")))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    
}
