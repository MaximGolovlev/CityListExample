//
//  CityCarouselView.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct CityCarouselView: View {
    @ObservedObject var cityData: CityData
    @State private var showingAddCityList = false
    
    var body: some View {
        VStack {

            GeometryReader { geometry in
                SnapCarousel(
                    itemCount: cityData.cityLists.count + 1,
                    itemWidth: 250,
                    spacing: 10,
                    selectedIndex: $cityData.selectedListIndex
                ) { index in
                    Group {
                        if index < cityData.cityLists.count {
                            CityListViewCard(list: cityData.cityLists[index])
                        } else {
                            AddCityListButton {
                                showingAddCityList = true
                            }
                        }
                    }
                }
            }
            .frame(height: 150)
            .padding(.vertical, 20)
            
            List {
                Section(header: Text("Города списка")) {
                    ForEach(cityData.cityLists[cityData.selectedListIndex ?? 0].cities) { city in
                        Text(city.name)
                    }
                }
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .sheet(isPresented: $showingAddCityList) {
            AddCityListView(cityData: cityData)
        }
    }
}
