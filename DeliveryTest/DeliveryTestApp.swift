//
//  DeliveryTestApp.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import SwiftUI

@main
struct DeliveryTestApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject private var dishesModelData = DishesModelData()
    @StateObject private var arrayBusket = ArrayBusket()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(dishesModelData)
                .environmentObject(arrayBusket)
        }
    }
}
