//
//  StepperCount.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 04.07.2023.
//

//import SwiftUI
//
//struct StepperCount: View {
//    @Binding var dishesModelData: DishesModelData
//    
//    var dish: DishesDetail
//    
//    func countOfDish(arrayBusket: [DishesDetail], dishName: String) -> Int {
//        var countOfDish = 0
//        for item in arrayBusket {
//            if item.name == dishName {
//                countOfDish += 1
//            }
//        }
//        return countOfDish
//    }
//    
//    func subCountOfDish(dish: DishesDetail) {
//        if let index = dishesModelData.arrayBusket.firstIndex(where: { $0 == dish }) {
//        dishesModelData.arrayBusket.remove(at: index)
////            dishesModelData.objectWillChange.send()
//            }
//    }
//
//    func addCountOfDish(dish: DishesDetail) {
//        dishesModelData.arrayBusket.append(dish)
////        dishesModelData.objectWillChange.send()
//    }
//
//    var body: some View {
//        HStack {
//            ZStack {
//                Color(red: 0.9, green: 0.9, blue: 0.9)
//                .cornerRadius(10)
//                HStack {
//                    Button(action: {
//                       subCountOfDish(dish: dish)
//                    }) {
//                        Image(systemName: "minus")
//                    }
//                    Text(String(countOfDish(arrayBusket: dishesModelData.arrayBusket, dishName: dish.name)))
//            
//                    Button(action: {
//                        addCountOfDish(dish: dish)
//                        
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                }
//                .padding(.horizontal, 4)
//            }
//        }
//        .foregroundColor(.black)
//        .frame(width: 100, height: 40)
//    }
//}
//
//struct StepperCount_Previews: PreviewProvider {
//    @State static var dishesModelData = DishesModelData()
//    @State static var dish: DishesDetail = dishesModelData.dishesDetail[0]
//
//    static var previews: some View {
//        StepperCount(dishesModelData: $dishesModelData, dish: dish)
//            .environmentObject(dishesModelData)
//    }
//}
