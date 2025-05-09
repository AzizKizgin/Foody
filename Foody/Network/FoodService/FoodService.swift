//
//  FoodService.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation
import Combine

class FoodService: FoodServiceProtocol {
    let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    func getAllCategories() -> AnyPublisher<CategoriesResponse, any Error> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: "\(baseURL)/categories.php")!)
            .map(\.data)
            .decode(type: CategoriesResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                if error is DecodingError {
                    return NetworkError.decodingError
                }
                return NetworkError.unknown
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<MealsResponse, any Error> {
        return URLSession.shared
            .dataTaskPublisher(
                for: URL(string: "\(baseURL)/filter.php?c=\(category)")!
            )
            .map(\.data)
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decodingError
                }
                return NetworkError.unknown
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getMealByID(id: String) -> AnyPublisher<MealsResponse, any Error> {
        return URLSession.shared
            .dataTaskPublisher(
                for: URL(string: "\(baseURL)/lookup.php?i=\(id)")!
            )
            .map(\.data)
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decodingError
                }
                return NetworkError.unknown
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getMealByMainIngredient(ingredient: String) -> AnyPublisher<MealsResponse, any Error> {
        return URLSession.shared
            .dataTaskPublisher(
                for: URL(string: "\(baseURL)/filter.php?i=\(ingredient)")!
            )
            .map(\.data)
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decodingError
                }
                return NetworkError.unknown
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    
}
