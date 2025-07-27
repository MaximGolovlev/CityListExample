//
//  Untitled.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import Combine
import Foundation

class CityData: ObservableObject {

    @Published var allCountries: [Country] = Country.makeAll
    
    private let defaultList: CityList = CityList(
        name: "Европа",
        shortName: "EUR",
        cities: CountryType.russia.cities,
        colorName: ColorOption.red.rawValue
    )
    
    @Published var cityLists: [CityList] = [] {
        didSet {
            storage.save(cityLists: cityLists)
        }
    }
    
    @Published var selectedListIndex: Int? = nil {
        didSet {
            storage.saveSelectedListIndex(selectedListIndex)
        }
    }
    
    private let storage = CityListStorage()
    
    init() {
        if let savedLists = storage.load() {
            cityLists = savedLists
            selectedListIndex = storage.loadSelectedListIndex() ?? 0
        } else {
            cityLists = [defaultList]
            selectedListIndex = 0
        }
    }
    
    func clearStorage() {
        storage.clear()
        cityLists = [defaultList]
    }
}
