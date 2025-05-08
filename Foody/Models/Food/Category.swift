//
//  Category.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation

struct Category: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let image: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
        case desc = "strCategoryDescription"
    }
}

