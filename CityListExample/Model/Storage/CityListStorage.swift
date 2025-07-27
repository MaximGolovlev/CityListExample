//
//  CityListStorage.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import Foundation

class CityListStorage {
    private let userDefaults = UserDefaults.standard
    private let cityListsKey = "savedCityLists"
    private let selectedListIndexKey = "selectedCityListIndex"
    
    func save(cityLists: [CityList]) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(cityLists)
            userDefaults.set(encodedData, forKey: cityListsKey)
        } catch {
            print("Error encoding city lists: \(error)")
        }
    }
    
    func load() -> [CityList]? {
        guard let savedData = userDefaults.data(forKey: cityListsKey) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let cityLists = try decoder.decode([CityList].self, from: savedData)
            return cityLists
        } catch {
            print("Error decoding city lists: \(error)")
            return nil
        }
    }
    
    func saveSelectedListIndex(_ index: Int?) {
        userDefaults.set(index, forKey: selectedListIndexKey)
    }
    
    func loadSelectedListIndex() -> Int? {
        let index = userDefaults.integer(forKey: selectedListIndexKey)
        return index >= 0 ? index : nil
    }
    
    func clear() {
        userDefaults.removeObject(forKey: cityListsKey)
        userDefaults.removeObject(forKey: selectedListIndexKey)
    }
}
