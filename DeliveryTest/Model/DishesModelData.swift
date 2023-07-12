//
//  DishesModelData.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import Foundation
import UIKit

final class DishesModelData: ObservableObject {
    @Published var dishesDetail: [DishesDetail] = []
    
    init() {
        loadDishesDetailData()
    }
    
    func loadDishesDetailData() {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dictionary = try decoder.decode([String: [DishesDetail]].self, from: data)
                
                // Получаем массив [DishesDetail] из словаря, используя первое значение
                if let dishesDetail = dictionary.values.first {
                    DispatchQueue.main.async {
                        self?.dishesDetail = dishesDetail
                        
                        for i in 0..<dishesDetail.count {
                            if let image_UrlString = dishesDetail[i].image_url,
                               let image_Url = URL(string: image_UrlString) {
                                self?.loadImage(from: image_Url) { loadedImage in
                                    DispatchQueue.main.async {
                                        self?.dishesDetail[i].image = loadedImage
                                    }
                                }
                            }
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    
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
