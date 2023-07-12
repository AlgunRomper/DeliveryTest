//
//  ModelData.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import Foundation
import UIKit

final class ModelData: ObservableObject {
    @Published var foodsCategory: [FoodsCategory] = []

    init() {
        loadFoodsCategoryData()
    }

    func loadFoodsCategoryData() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    // Обработка ошибки
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let dictionary = try decoder.decode([String: [FoodsCategory]].self, from: data)

                // Получаем массив [FoodsCategory] из словаря, используя первое значение
                if let foodsCategory = dictionary.values.first {
                    DispatchQueue.main.async {
                        self?.foodsCategory = foodsCategory

                        for i in 0..<foodsCategory.count {
                            if let image_UrlString = foodsCategory[i].image_url,
                               let image_Url = URL(string: image_UrlString) {
                                self?.loadImage(from: image_Url) { loadedImage in
                                    DispatchQueue.main.async {
                                        self?.foodsCategory[i].image = loadedImage
                                    }
                                }
                            }
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    // Обработка ошибки
                }
            }
        }.resume()
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
