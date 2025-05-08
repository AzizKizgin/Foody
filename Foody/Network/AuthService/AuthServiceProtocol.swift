//
//  AuthServiceProtocol.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

protocol AuthServiceProtocol {
    func register(info: RegisterDto) -> AnyPublisher<User, Error>
    func login(info: LoginDto) -> AnyPublisher<User, Error>
    func resetPassword(email: String) -> AnyPublisher <String, Error>
}
