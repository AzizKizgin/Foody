//
//  RegisterDto.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation

struct RegisterDto: Encodable {
    var name: String
    var email: String
    var password: String
    var confirmPassword: String
}
