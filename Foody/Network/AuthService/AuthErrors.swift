//
//  AuthErrors.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Combine

enum AuthErrors: Error {
    case loginFail(String)
    case registerFail(String)
    case invalidEmail(String)
}
