//
//  DishCategoryItem.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//
//делаем view для отдельного тега

import SwiftUI

struct DishCategoryItem: View {
    var teg: String
    var isSelected: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? Color.blue : Color(red: 0.9, green: 0.9, blue: 0.9))
                .frame(width: 120, height: 50)
            
            Text(teg)
                .foregroundColor(isSelected ? Color.white : Color.black)
        }
    }
}

struct DishCategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        DishCategoryItem(teg: uniqueTegs[0], isSelected: true)
    }
}
