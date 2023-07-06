//
//  FoodsCategoryRow.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//
//view для отдельной строки на главной странице

import SwiftUI

struct FoodsCategoryRow: View {
    var foodsCategory: FoodsCategory
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if let image = foodsCategory.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
            } else {
                Color.gray
            }
            Text(foodsCategory.name)
                    .font(.title2)
                    .padding()
        }
    }
}

struct FoodsCategoryRow_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        FoodsCategoryRow(foodsCategory: modelData.foodsCategory[0])
    }
}
