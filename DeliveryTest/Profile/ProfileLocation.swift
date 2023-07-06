//
//  ProfileLocation.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 05.07.2023.
//

import SwiftUI
import CoreLocation

//struct ProfileLocation: View {
//
//    // Значение по умолчанию
//    @State private var currentCity: String = "Санкт-Петербург"
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(currentCity)
//                .font(.headline)
//                .bold()
//                .padding(.horizontal, -5)
//        }
//        .onAppear {
//            updateCurrentCity()
//        }
//    }
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
//                            DispatchQueue.main.async {
//                                currentCity = city
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
////    private func updateCurrentCity() {
////        let locationManager = CLLocationManager()
////
////        // Проверяем доступность служб местоположения
////        if CLLocationManager.locationServicesEnabled() {
////            locationManager.requestWhenInUseAuthorization()
////
////            // Получаем местоположение пользователя
////            if let location = locationManager.location {
////                let geocoder = CLGeocoder()
////                geocoder.reverseGeocodeLocation(location) { placemarks, error in
////                    if let placemark = placemarks?.first {
////                        // Извлекаем город из информации о местоположении
////                        if let city = placemark.locality {
////                            currentCity = city
////                        }
////                    }
////                }
////            }
////        }
////    }
//}
//
//struct ProfileLocation_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileLocation()
//    }
//}
//
//struct ProfileLocation: View {
//    @State private var currentCity: String = "Санкт-Петербург"
//    
//    private let locationManager = CLLocationManager()
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(currentCity)
//                .font(.headline)
//                .bold()
//                .padding(.horizontal, -5)
//        }
//        .onAppear {
//            locationManager.delegate = self
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.startUpdatingLocation()
//        }
//    }
//}
//
//extension ProfileLocation: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        if manager.authorizationStatus == .authorizedWhenInUse {
//            locationManager.requestLocation()
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            let geocoder = CLGeocoder()
//            geocoder.reverseGeocodeLocation(location) { placemarks, error in
//                if let placemark = placemarks?.first {
//                    if let city = placemark.locality {
//                        DispatchQueue.main.async {
//                            currentCity = city
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location manager failed with error: \(error)")
//    }
//}
