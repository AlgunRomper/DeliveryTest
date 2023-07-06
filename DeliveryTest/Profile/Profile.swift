//
//  Profile.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

//import Foundation
//import SwiftUI
//import CoreLocation
//
//struct Profile: Codable, Hashable, Decodable, CLLocationManagerDelegate {
//    
//    var currentCity: String = "Санкт-Петербург"
//    
//    private func updateCurrentCity() {
//        let locationManager = CLLocationManager()
//        
//        // Проверяем доступность служб местоположения
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.requestWhenInUseAuthorization()
//            
//            // Получаем местоположение пользователя
//            if let location = locationManager.location {
//                let geocoder = CLGeocoder()
//                geocoder.reverseGeocodeLocation(location) { placemarks, error in
//                    if let placemark = placemarks?.first {
//                        // Извлекаем город из информации о местоположении
//                        if let city = placemark.locality {
//                            currentCity = city
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
