//
//  AddCityListView.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct AddCityListView: View {
    @ObservedObject var cityData: CityData
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var shortName = ""
    @State private var selectedColorIndex = 0
    @State private var selectedCities: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Информация о списке")) {
                    TextField("Краткое имя списка", text: $shortName)
                    TextField("Длинное имя списка", text: $name)
                    
                    Picker("Цвет", selection: $selectedColorIndex) {
                        ForEach(0..<ColorOption.allCases.count, id: \.self) { index in
                            HStack {
                                Circle()
                                    .fill(ColorOption.allCases[index].color)
                                    .frame(width: 20, height: 20)
                                Text(ColorOption.allCases[index].rawValue)
                            }
                            .tag(index)
                        }
                    }
                }
                
                Section {
                    EmptyView()
                } header: {
                    Text("Выберите 5 городов")
                        .font(.headline)
                        .padding(.top, 8)
                } footer: {
                    Text("Выбрано: \(selectedCities.count)/5")
                        .font(.caption)
                        .foregroundColor(selectedCities.count == 5 ? .green : .secondary)
                }
                
                ForEach(cityData.allCountries) { country in
                    Section(header: Text(country.name)) {
                        ForEach(country.cities) { city in
                            HStack {
                                Text(city.name)
                                Spacer()
                                if selectedCities.contains(city.id) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selectedCities.contains(city.id) {
                                    selectedCities.remove(city.id)
                                } else {
                                    if selectedCities.count < 5 {
                                        selectedCities.insert(city.id)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Новый список")
            .navigationBarItems(
                leading: Button("Отмена") {
                    dismiss()
                },
                trailing: Button("Готово") {
                    addNewCityList()
                    dismiss()
                }
                .disabled(name.isEmpty || shortName.isEmpty || selectedCities.count != 5)
            )
        }
    }
    
    private func addNewCityList() {
        let cities = cityData.allCountries.flatMap({ $0.cities }).filter { selectedCities.contains($0.id) }
        let newList = CityList(
            name: name,
            shortName: shortName,
            cities: cities,
            colorName: ColorOption.allCases[selectedColorIndex].rawValue
        )
        cityData.cityLists.append(newList)
        cityData.selectedListIndex = cityData.cityLists.count - 1
    }
}
