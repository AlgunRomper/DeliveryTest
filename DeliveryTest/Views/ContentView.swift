//
//  ContentView.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .home
    @State var selectedCategory: FoodsCategory? = nil
    @State private var currentDate = Date()
    
    enum Tab: String {
        case home = "Главная"
        case search = "Поиск"
        case basket = "Корзина"
        case account = "Аккаунт"
    }
    
    var body: some View {
        
        //кнопки навигации внизу экрана и связь их с другими views
        NavigationView {
            TabView(selection: $selectedTab) {
                FoodsCategoryList(selectedCategory: $selectedCategory)
                    .tabItem {
                        Label("Главная", systemImage: "house")
                    }
                    .tag(Tab.home)
                
                Text("Поиск")
                    .tabItem {
                        Label("Поиск", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)
                
                Busket()
                    .tabItem {
                        Label("Корзина", systemImage: "cart")
                    }
                    .tag(Tab.basket)
                
                Text("Аккаунт")
                    .tabItem {
                        Label("Аккаунт", systemImage: "person.circle")
                    }
                    .tag(Tab.account)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        HStack {
                            Image("Location")
                                .padding(.bottom, -8)
                            VStack(alignment: .leading) {
                                Text("Санкт-Петербург")
                                // ProfileLocation()
                                    .font(.headline)
                                    .bold()
                                Text(currentDate, style: .date)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            CirclePhotoProfile(image: Image("Unknown"))
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(ModelData())
                .environmentObject(DishesModelData())
                .environmentObject(ArrayBusket())
        }
    }
}


