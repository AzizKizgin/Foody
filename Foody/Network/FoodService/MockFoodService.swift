//
//  MockFoodService.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import Foundation
import Combine

class MockFoodService: FoodServiceProtocol {
    func getAllCategories() -> AnyPublisher<CategoriesResponse, Error> {
        let categories = [
            Category(id: "1", name: "Beef", image: "https://www.themealdb.com//images//category//beef.png", desc: "Beef dishes"),
            Category(id: "2", name: "Chicken", image: "https://www.themealdb.com//images//category//beef.png", desc: "Chicken dishes"),
            Category(id: "3", name: "Dessert", image: "https://www.themealdb.com//images//category//beef.png", desc: "Dessert dishes")
        ]

        return Just(CategoriesResponse(categories: categories))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getMealsByCategory(category: String) -> AnyPublisher<MealsResponse, Error> {
        let meals = [
            Meal(id: "101", name: "\(category) Curry", drinkAlternate: nil, category: category, area: "Indian", instructions: "Cook with spices.", image: "https://example.com/curry.jpg", tags: "Spicy,Hot", youtubeLink: nil,
                 ingredient1: "Chicken", ingredient2: "Curry Powder", ingredient3: "Salt", ingredient4: nil, ingredient5: nil,
                 ingredient6: nil, ingredient7: nil, ingredient8: nil, ingredient9: nil, ingredient10: nil,
                 ingredient11: nil, ingredient12: nil, ingredient13: nil, ingredient14: nil, ingredient15: nil,
                 ingredient16: nil, ingredient17: nil, ingredient18: nil, ingredient19: nil, ingredient20: nil,
                 measure1: "200g", measure2: "2 tbsp", measure3: "to taste", measure4: nil, measure5: nil,
                 measure6: nil, measure7: nil, measure8: nil, measure9: nil, measure10: nil,
                 measure11: nil, measure12: nil, measure13: nil, measure14: nil, measure15: nil,
                 measure16: nil, measure17: nil, measure18: nil, measure19: nil, measure20: nil,
                 source: nil, imageSource: nil, creativeCommonsConfirmed: nil, dateModified: nil)
        ]
        return Just(MealsResponse(meals: meals))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getMealByID(id: String) -> AnyPublisher<MealsResponse, Error> {
        let meal = Meal(id: id, name: "Mock Meal", drinkAlternate: "Mock Drink", category: "Mock Category", area: "Global", instructions: "Mock cooking steps.", image: "https://example.com/mock.jpg", tags: "Mock,Test", youtubeLink: "https://youtube.com/mock",
                        ingredient1: "Mock Ingredient 1", ingredient2: "Mock Ingredient 2", ingredient3: nil, ingredient4: nil, ingredient5: nil,
                        ingredient6: nil, ingredient7: nil, ingredient8: nil, ingredient9: nil, ingredient10: nil,
                        ingredient11: nil, ingredient12: nil, ingredient13: nil, ingredient14: nil, ingredient15: nil,
                        ingredient16: nil, ingredient17: nil, ingredient18: nil, ingredient19: nil, ingredient20: nil,
                        measure1: "1 cup", measure2: "2 tsp", measure3: nil, measure4: nil, measure5: nil,
                        measure6: nil, measure7: nil, measure8: nil, measure9: nil, measure10: nil,
                        measure11: nil, measure12: nil, measure13: nil, measure14: nil, measure15: nil,
                        measure16: nil, measure17: nil, measure18: nil, measure19: nil, measure20: nil,
                        source: "https://example.com/source", imageSource: "https://example.com/image-source", creativeCommonsConfirmed: "Yes", dateModified: nil)
        return Just(MealsResponse(meals: [meal]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getMealByMainIngredient(ingredient: String) -> AnyPublisher<MealsResponse, Error> {
        let meal = Meal(id: "202", name: "\(ingredient) Delight", drinkAlternate: nil, category: "Test", area: "Fusion", instructions: "Mix everything and cook.", image: "https://example.com/ingredient.jpg", tags: nil, youtubeLink: nil,
                        ingredient1: ingredient, ingredient2: "Salt", ingredient3: "Oil", ingredient4: nil, ingredient5: nil,
                        ingredient6: nil, ingredient7: nil, ingredient8: nil, ingredient9: nil, ingredient10: nil,
                        ingredient11: nil, ingredient12: nil, ingredient13: nil, ingredient14: nil, ingredient15: nil,
                        ingredient16: nil, ingredient17: nil, ingredient18: nil, ingredient19: nil, ingredient20: nil,
                        measure1: "100g", measure2: "1 tsp", measure3: "1 tbsp", measure4: nil, measure5: nil,
                        measure6: nil, measure7: nil, measure8: nil, measure9: nil, measure10: nil,
                        measure11: nil, measure12: nil, measure13: nil, measure14: nil, measure15: nil,
                        measure16: nil, measure17: nil, measure18: nil, measure19: nil, measure20: nil,
                        source: nil, imageSource: nil, creativeCommonsConfirmed: nil, dateModified: nil)
        return Just(MealsResponse(meals: [meal]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
