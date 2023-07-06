//
//  DishesCategoryRow.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//
//делаем скролл с уникальными тегами

import SwiftUI

struct DishesCategoryRow: View {
    var uniqueTegs: [String]
    
    @State var selectedTeg: String
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(uniqueTegs, id: \.self) { teg in
                    Button(action: {
                        selectedTeg = teg
                    }) {
                        DishCategoryItem(teg: teg, isSelected: teg == selectedTeg)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 50)
        }
    }
}

struct DishesCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        DishesCategoryRow(uniqueTegs: uniqueTegs, selectedTeg: uniqueTegs[0])
    }
}
