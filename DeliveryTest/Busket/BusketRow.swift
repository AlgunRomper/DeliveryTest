//
//  BusketRow.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 03.07.2023.
//

import SwiftUI

struct BusketRow: View {
    @EnvironmentObject var arrayBusket: ArrayBusket
    
    var dish: DishesDetail
            
    var body: some View {
        HStack {
            DishImage(dish: dish)
                .frame(width: 70, height: 70)

            VStack(alignment: .leading) {
                Text(dish.name)
                HStack {
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
            }
            .padding(.horizontal, 5)
            Spacer()
            
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
            .frame(width: 100, height: 40)
        }
        .padding()
    }
}

struct BusketRow_Previews: PreviewProvider {
    static var dishesModelData = DishesModelData()
    static var arrayBusket = ArrayBusket()
    
       static var previews: some View {
           BusketRow(dish: dishesModelData.dishesDetail[0])
               .environmentObject(arrayBusket)
    }
}
