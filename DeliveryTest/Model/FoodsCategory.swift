//
//  FoodsCategory.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import Foundation
import UIKit

struct FoodsCategory: Decodable, Identifiable, Hashable {
    
    var id: Int
    var name: String
    var image_url: String?
    var image: UIImage?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case image_url
    }
}
