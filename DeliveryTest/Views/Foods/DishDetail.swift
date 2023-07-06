//
//  dishDetail.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import SwiftUI

struct DishDetail: View {
    @EnvironmentObject var dishesModelData: DishesModelData
    @EnvironmentObject var arrayBusket: ArrayBusket
    
    var dish: DishesDetail
    
    var dishIndex: Int {
        DishesModelData().dishesDetail.firstIndex(where: {$0.id == dish.id})!
    }
    
    @State private var showAlert = false
    
    var body: some View {
        
        VStack {
            ScrollView {
                ZStack(alignment: .topTrailing) {
                    //вставляем изображение
                    DishImage(dish: dish)
                        .frame(width: 350, height: 350)
                    //вставляем кнопку для отметки избранного
                    FavoriteButton(isSet: $dishesModelData.dishesDetail[dishIndex].isFavorite)
                        .padding(10)
                        .offset(x: -10, y: 10)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    //наименование блюда
                    Text(dish.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack(spacing: 4) {
                        HStack {
                            //цена блюда
                            Text(String(dish.price))
                                .padding(.horizontal, 0)
                            Image(systemName: "rublesign")
                        }
                        .fontWeight(.medium)
                        
                        HStack {
                            Text("-")
                            //вес блюда
                            Text(String(dish.weight))
                            Text("г")
                        }
                        .foregroundColor(.secondary)
                    }
                    //описание блюда
                    Text(dish.description)
                }
                
                
                Spacer()
                
                HStack {
                    //кнопка для добавления в корзину
                    Button(action: {
                        showAlert = true
                        arrayBusket.arrayBusket.append(dish)
                    }) {
                        Text("Добавить в корзину")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    //кнопки для изменения количества в корзине
                    HStack {
                        ZStack {
                            Color(red: 0.9, green: 0.9, blue: 0.9)
                                .cornerRadius(10)
                            HStack {
                                Button(action: {
                                    arrayBusket.subCountOfDish(dish: dish)
                                }) {
                                    Image(systemName: "minus")
                                }
                                Text(String(arrayBusket.countOfDish(dishName: dish.name)))
                                
                                Button(action: {
                                    arrayBusket.addCountOfDish(dish: dish)
                                    
                                }) {
                                    Image(systemName: "plus")
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                    .foregroundColor(.black)
                    .frame(width: 100, height: 50)
                }
                
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Блюдо добавлено в корзину"))
            }
            
        }
        .padding()
    }
}

struct dishDetail_Previews: PreviewProvider {
    static var dishesModelData = DishesModelData()
    static var arrayBusket = ArrayBusket()
    
    static var previews: some View {
        DishDetail(dish: DishesModelData().dishesDetail[0])
            .environmentObject(dishesModelData)
            .environmentObject(arrayBusket)
    }
}
