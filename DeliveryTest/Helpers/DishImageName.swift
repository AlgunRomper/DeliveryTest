//
//  DishImageName.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 03.07.2023.
//

import SwiftUI

struct DishImageName: View {
    var dish: DishesDetail
   
    var body: some View {
        VStack(spacing: 5) {
            //вставляем изображение
            ZStack(alignment: .center) {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .cornerRadius(10)
                
            DishImage(dish: dish)
            }
            .frame(width: 110, height: 110)
            
            //вставляем наименование блюда
            HStack(alignment: .top) {
                Text(dish.name)
                    .font(.system(size: 15))
                    .lineLimit(nil)
                    .frame(width: 110, height: 80)
                    .padding(.top, -20)
            }
        }
    }
}

struct DishImageName_Previews: PreviewProvider {
    static var dishesModelData = DishesModelData()
    
    static var previews: some View {
        DishImageName(dish: dishesModelData.dishesDetail[0])
    }
}
