//
//  Untitled.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct CityListView: View {
    @Binding var list: CityList
    
    var body: some View {
        NavigationView {
            List {
                Section(list.name) {
                    ForEach(list.cities) { city in
                        HStack {
                            Text(city.name)
                            Spacer()
                            Text(city.yearString)
                                .foregroundColor(.gray)
                        }
                    }
                    .onMove(perform: moveCities)
                }
            }
            .navigationTitle("Города")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func moveCities(from source: IndexSet, to destination: Int) {
        list.cities.move(fromOffsets: source, toOffset: destination)
    }
}
