//
//  ColorOption.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

enum ColorOption: String, CaseIterable {
    case red = "Красный"
    case blue = "Синий"
    case green = "Зеленый"
    case orange = "Оранжевый"
    case purple = "Фиолетовый"
    
    var color: Color {
        switch self {
        case .red: return .red
        case .blue: return .blue
        case .green: return .green
        case .orange: return .orange
        case .purple: return .purple
        }
    }
    
    static func color(for name: String) -> Color {
        return ColorOption(rawValue: name)?.color ?? .blue
    }
}
