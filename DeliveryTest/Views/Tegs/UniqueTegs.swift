//
//  UniqueTegs.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 03.07.2023.
//

//создаем массив с уникальными значениями тегов

import Foundation

var dishes: [DishesDetail] = DishesModelData().dishesDetail
let uniqueTegs = Array(Set(dishes.flatMap { $0.tegs })).sorted(by: <)
