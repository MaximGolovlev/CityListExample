//
//  Untitled.swift
//  CityListExample
//
//  Created by Максим on 27.07.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var cityData = CityData()
    @State private var showModal = false
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {

            CityListView(list: $cityData.cityLists[cityData.selectedListIndex ?? 0])
                .tabItem {
                    Label("", systemImage: "list.bullet")
                }
                .tag(0)
            

            Color.clear
            .tabItem {
                let name = cityData.cityLists[cityData.selectedListIndex ?? 0].name
                let color = cityData.cityLists[cityData.selectedListIndex ?? 0].color
                Label(name, systemImage: "circle.fill")
                     .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        color,
                        .primary
                    )
            }
            .tag(1)
            .onAppear() {
                DispatchQueue.main.async {
                    showModal = true
                    selectedTab = 0
                }
            }
        }
        .sheet(isPresented: $showModal) {
            CityCarouselView(cityData: cityData)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
