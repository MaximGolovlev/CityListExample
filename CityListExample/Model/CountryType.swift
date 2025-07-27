//
//  CountryType.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import Foundation

enum CountryType: String, Identifiable, Codable, CaseIterable {
    case russia = "Россия"
    case germany = "Германия"
    case france = "Франция"
    case italy = "Италия"
    case usa = "США"
    case japan = "Япония"
    
    var id: String { rawValue }
    
    var cities: [City] {
        switch self {
        case .russia:
            [
                City(name: "Москва", foundingYear: 1147),
                City(name: "Санкт-Петербург", foundingYear: 1703),
                City(name: "Казань", foundingYear: 1005),
                City(name: "Нижний Новгород", foundingYear: 1221),
                City(name: "Сочи", foundingYear: 1838)
            ]
        case .germany:
            [
                City(name: "Берлин", foundingYear: 1237),
                City(name: "Мюнхен", foundingYear: 1158),
                City(name: "Гамбург", foundingYear: 808),
                City(name: "Кёльн", foundingYear: -38),
                City(name: "Франкфурт-на-Майне", foundingYear: 794)
            ]
        case .france:
            [
                City(name: "Париж", foundingYear: -52),
                City(name: "Марсель", foundingYear: -600),
                City(name: "Лион", foundingYear: -43),
                City(name: "Тулуза", foundingYear: 106),
                City(name: "Ницца", foundingYear: 350)
            ]
        case .italy:
            [
                City(name: "Рим", foundingYear: -753),
                City(name: "Милан", foundingYear: -400),
                City(name: "Венеция", foundingYear: 421),
                City(name: "Флоренция", foundingYear: 59),
                City(name: "Неаполь", foundingYear: -680)
            ]
        case .usa:
            [
                City(name: "Нью-Йорк", foundingYear: 1624),
                City(name: "Лос-Анджелес", foundingYear: 1781),
                City(name: "Чикаго", foundingYear: 1833),
                City(name: "Хьюстон", foundingYear: 1836),
                City(name: "Филадельфия", foundingYear: 1682)
            ]
        case .japan:
            [
                City(name: "Токио", foundingYear: 1457),
                City(name: "Киото", foundingYear: 794),
                City(name: "Осака", foundingYear: 1496),
                City(name: "Иокогама", foundingYear: 1859),
                City(name: "Саппоро", foundingYear: 1868)
            ]
        }
    }
}
