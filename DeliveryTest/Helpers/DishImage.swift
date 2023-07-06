//
//  DishImage.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import SwiftUI

struct DishImage: View {
    var dish: DishesDetail
   
    var body: some View {
        ZStack(alignment: .center) {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .cornerRadius(10)
            
            if let image = dish.image {
                GeometryReader { geometry in
                    Image(uiImage: image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: geometry.size.width / 1.8, y: geometry.size.height / 1.75)
                }
            }
        }
    }
}

struct DishImage_Previews: PreviewProvider {
    static var dishesModelData = DishesModelData()
    
    static var previews: some View {
        DishImage(dish: dishesModelData.dishesDetail[0])
    }
}
