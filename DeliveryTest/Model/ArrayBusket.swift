//
//  ArrayBusket.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 05.07.2023.
//

import Foundation
import UIKit

final class ArrayBusket: ObservableObject {
    
    @Published var arrayBusket: [DishesDetail] = []
    
    func sumOfBusket() -> Int {
        var sumOfBusket = 0
        for dish in self.arrayBusket {
            sumOfBusket += dish.price
        }
        return sumOfBusket
    }
    
    func subCountOfDish(dish: DishesDetail) {
        if let index = self.arrayBusket.firstIndex(where: { $0.id == dish.id }) {
        self.arrayBusket.remove(at: index)
            }
    }

    func addCountOfDish(dish: DishesDetail) {
        self.arrayBusket.append(dish)
    }
    
    func countOfDish(dishName: String) -> Int {
        var countOfDish = 0
        for item in self.arrayBusket {
            if item.name == dishName {
                countOfDish += 1
            }
        }
        return countOfDish
    }
    
}
