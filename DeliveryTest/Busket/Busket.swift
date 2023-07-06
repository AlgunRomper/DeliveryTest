//
//  Busket.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 03.07.2023.
//

import SwiftUI

struct Busket: View {
    @EnvironmentObject var arrayBusket: ArrayBusket
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            ForEach(Array(arrayBusket.arrayBusket
                .reduce(into: [String: DishesDetail]()) { result, dish in
                    result[dish.name] = dish
                }
                .values)) { dish in
                    NavigationLink(destination: DishDetail(dish: dish)) {
                        BusketRow(arrayBusket: _arrayBusket, dish: dish)
                    }
//                    NavigationLink {
//                        DishDetail(dish: dish)
//                    } label: {
//                        BusketRow(arrayBusket: _arrayBusket, dish: dish)
//                    }
                }
            .foregroundColor(.black)
            Spacer()
            
            //кнопка для оплаты
            Button(action: {
                showAlert = true
            }) {
                Text("Оплатить \(arrayBusket.sumOfBusket()) ₽")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Отлично"))
        }
    }
}

struct Busket_Previews: PreviewProvider {
    static var arrayBusket = ArrayBusket()

    static var previews: some View {
        Busket()
            .environmentObject(arrayBusket)
    }
}
