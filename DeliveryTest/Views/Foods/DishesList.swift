//
//  dishesList.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import SwiftUI

struct DishesList: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dishesModelData: DishesModelData
    @EnvironmentObject var arrayBusket: ArrayBusket
    
    var dishes: [DishesDetail] {
        dishesModelData.dishesDetail.filter { dish in
            selectedTeg == uniqueTegs.first || dish.tegs.contains(selectedTeg ?? "Категория не выбрана")
        }
    }
    
    @State private var uniqueTegs: [String] = []
    
    @State private var selectedDish: DishesDetail?
    @State private var isShowingAlert = false
    
    @State private var selectedTeg: String?
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Binding var selectedCategory: FoodsCategory?
    
    @State private var isShowingDishDetail = false
    @State private var selectedDishDetail: DishesDetail?
    
    init(selectedCategory: Binding<FoodsCategory?>) {
        _selectedCategory = selectedCategory
        
//        if !uniqueTegs.isEmpty {
//            selectedTeg = uniqueTegs[0]
//        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                размещаем скролл с тегами
                HStack {
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
                
                //располагаем все наименования блюд с изображениями, по нажатию происходит переход на view конкретного блюда
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
                        ForEach(dishes) { dish in
                            Button(action: {
                                selectedDishDetail = dish
                                isShowingDishDetail = true
                            }) {
                                DishImageName(dish: dish)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding()
                }
                .foregroundColor(.black)
            }
            .sheet(isPresented: $isShowingDishDetail) {
                if let dish = selectedDishDetail {
                    DishDetail(dish: dish)
                }
            }
            .toolbar {
                Text(selectedCategory?.name ?? "")
                    .font(.title2)
                    .bold()
            }
        }
        .onReceive(dishesModelData.$dishesDetail) { dishesDetail in
            uniqueTegs = Array(Set(dishesDetail.flatMap { $0.tegs })).sorted(by: <)
            selectedTeg = uniqueTegs[0]
        }
    }
}

struct dishesList_Previews: PreviewProvider {
    
    static var previews: some View {
        DishesList(selectedCategory: .constant(FoodsCategory(id: 0, name: "Выбранная категория")))
            .environmentObject(ModelData())
            .environmentObject(DishesModelData())
            .environmentObject(ArrayBusket())
        
    }
}
