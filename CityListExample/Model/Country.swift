//
//  Country.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import Foundation

struct Country: Identifiable, Codable {
    var id = UUID()
    let name: String
    let cities: [City]
    
    static func make(type: CountryType) -> Country {
        Country(name: type.rawValue, cities: type.cities)
    }
    
    static var makeAll: [Country] {
        CountryType.allCases.map({ Country(name: $0.rawValue, cities: $0.cities) })
    }
}
