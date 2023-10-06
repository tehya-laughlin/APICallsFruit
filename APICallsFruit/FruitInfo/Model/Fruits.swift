//
//  Fruits.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/19/23.
//

import SwiftUI

struct Fruit: Codable, Identifiable {
    var name: String
    var id: Int
    var family: String
    var order: String
    var genus: String
    var nutritions: Nutrition
}

struct Nutrition: Codable {
    var calories: Int
    var fat: Double
    var sugar: Double
    var carbohydrates: Double
    var protein: Double
}

