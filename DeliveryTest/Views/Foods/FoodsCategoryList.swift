//
//  FoodsCategoryList.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import SwiftUI

struct FoodsCategoryList: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dishesModelData: DishesModelData
    
    @Binding var selectedCategory: FoodsCategory?
    
    var body: some View {
        NavigationView {
            List(modelData.foodsCategory) { foodsCategory in
                NavigationLink(destination: DishesList(selectedCategory: $selectedCategory)) {
                    FoodsCategoryRow(foodsCategory: foodsCategory)
                }
                .onTapGesture {
                    selectedCategory = foodsCategory
                }
            }
            .listStyle(.plain)
        }
    }
}

struct FoodsCategoryList_Previews: PreviewProvider {
    static var modelData = ModelData()
    static var dishesModelData = DishesModelData()
    
    static var previews: some View {
        FoodsCategoryList(selectedCategory: .constant(FoodsCategory(id: 1, name: "Выбранная категория")))
            .environmentObject(modelData)
            .environmentObject(dishesModelData)
    }
}
