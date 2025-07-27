//
//  City.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import Foundation

struct City: Identifiable, Hashable, Equatable, Codable {
    var id = UUID()
    let name: String
    let foundingYear: Int
    
    var yearString: String {
        foundingYear < 0 ? "\(-foundingYear) год до н.э" : "\(foundingYear) год"
    }
}
