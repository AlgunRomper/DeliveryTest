//
//  ModelData.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import Foundation
import UIKit


final class ModelData: ObservableObject {
    
    @Published var foodsCategory: [FoodsCategory] = load("foodsCategoryData.json")
    
    init() {
        loadFoodsCategoryData()
    }
    
    func loadFoodsCategoryData() {
        let filename = "foodsCategoryData.json"
        self.foodsCategory = load(filename)
        
        for i in 0..<self.foodsCategory.count {
            if let image_UrlString = self.foodsCategory[i].image_url,
               let image_Url = URL(string: image_UrlString) {
                loadImage(from: image_Url) { [weak self] loadedImage in
                    DispatchQueue.main.async {
                        self?.foodsCategory[i].image = loadedImage
                    }
                }
            }
        }
        
        func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                
                let image = UIImage(data: data)
                completion(image)
            }.resume()
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
