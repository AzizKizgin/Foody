//
//  Meal.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import Foundation

struct Meal : Decodable, Hashable {
    let id : String
    let name : String
    let drinkAlternate : String?
    let category : String?
    let area : String?
    let instructions : String?
    let image : String?
    let tags : String?
    let youtubeLink : String?
    let ingredient1 : String?
    let ingredient2 : String?
    let ingredient3 : String?
    let ingredient4 : String?
    let ingredient5 : String?
    let ingredient6 : String?
    let ingredient7 : String?
    let ingredient8 : String?
    let ingredient9 : String?
    let ingredient10 : String?
    let ingredient11 : String?
    let ingredient12 : String?
    let ingredient13 : String?
    let ingredient14 : String?
    let ingredient15 : String?
    let ingredient16 : String?
    let ingredient17 : String?
    let ingredient18 : String?
    let ingredient19 : String?
    let ingredient20 : String?
    let measure1 : String?
    let measure2 : String?
    let measure3 : String?
    let measure4 : String?
    let measure5 : String?
    let measure6 : String?
    let measure7 : String?
    let measure8 : String?
    let measure9 : String?
    let measure10 : String?
    let measure11 : String?
    let measure12 : String?
    let measure13 : String?
    let measure14 : String?
    let measure15 : String?
    let measure16 : String?
    let measure17 : String?
    let measure18 : String?
    let measure19 : String?
    let measure20 : String?
    let source : String?
    let imageSource : String?
    let creativeCommonsConfirmed : String?
    let dateModified : String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case tags = "strTags"
        case youtubeLink = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    func getIngredients() -> [Ingredient]{
        let ingredMeasurements = [
            Ingredient(name: self.ingredient1 ?? "", quantity: self.measure1 ?? ""),
            Ingredient(name: self.ingredient2 ?? "", quantity: self.measure2 ?? ""),
            Ingredient(name: self.ingredient3 ?? "", quantity: self.measure3 ?? ""),
            Ingredient(name: self.ingredient4 ?? "", quantity: self.measure4 ?? ""),
            Ingredient(name: self.ingredient5 ?? "", quantity: self.measure5 ?? ""),
            Ingredient(name: self.ingredient6 ?? "", quantity: self.measure6 ?? ""),
            Ingredient(name: self.ingredient7 ?? "", quantity: self.measure7 ?? ""),
            Ingredient(name: self.ingredient8 ?? "", quantity: self.measure8 ?? ""),
            Ingredient(name: self.ingredient9 ?? "", quantity: self.measure9 ?? ""),
            Ingredient(name: self.ingredient10 ?? "", quantity: self.measure10 ?? ""),
            Ingredient(name: self.ingredient11 ?? "", quantity: self.measure11 ?? ""),
            Ingredient(name: self.ingredient12 ?? "", quantity: self.measure12 ?? ""),
            Ingredient(name: self.ingredient13 ?? "", quantity: self.measure13 ?? ""),
            Ingredient(name: self.ingredient14 ?? "", quantity: self.measure14 ?? ""),
            Ingredient(name: self.ingredient15 ?? "", quantity: self.measure15 ?? ""),
            Ingredient(name: self.ingredient16 ?? "", quantity: self.measure16 ?? ""),
            Ingredient(name: self.ingredient17 ?? "", quantity: self.measure17 ?? ""),
            Ingredient(name: self.ingredient18 ?? "", quantity: self.measure18 ?? ""),
            Ingredient(name: self.ingredient19 ?? "", quantity: self.measure19 ?? ""),
            Ingredient(name: self.ingredient20 ?? "", quantity: self.measure20 ?? ""),
        ]
        return ingredMeasurements.filter { !($0.name.isEmpty || $0.quantity.isEmpty) }
    }
}

struct Ingredient: Codable, Identifiable {
    var id = UUID()
    
    let name: String
    let quantity: String
}
