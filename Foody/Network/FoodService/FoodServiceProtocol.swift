//
//  FoodServiceProtocol.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

protocol FoodServiceProtocol {
    func getAllCategories() -> AnyPublisher<CategoriesResponse, Error>
    func getMealsByCategory(category: String) -> AnyPublisher<MealsResponse, Error>
    func getMealByID(id: String) -> AnyPublisher<MealsResponse, Error>
    func getMealByMainIngredient(ingredient: String) -> AnyPublisher<MealsResponse, Error>
}
