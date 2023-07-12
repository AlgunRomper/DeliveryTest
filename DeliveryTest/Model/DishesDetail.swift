//
//  DishesDetail.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import Foundation
import UIKit

struct DishesDetail: Decodable, Identifiable, Equatable, Hashable {

    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var image_url: String?
    var image: UIImage?
    var tegs: [String]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case weight
        case description
        case image_url
        case tegs
    }
}
