//
//  Untitled.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct CityList: Identifiable, Codable {
    var id = UUID()
    var name: String
    var shortName: String
    var cities: [City]
    var colorName: String
    
    var color: Color {
        ColorOption.color(for: colorName)
    }
}
