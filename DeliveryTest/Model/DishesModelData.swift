//
//  DishesModelData.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import Foundation
import UIKit
import Kingfisher


final class DishesModelData: ObservableObject {
    
    @Published var dishesDetail: [DishesDetail] = loadDishes("dishesDetailData.json")
    
    init() {
        loadDishesDetailData()
    }
    
    
    func loadDishesDetailData() {
        let filename = "dishesDetailData.json"
        self.dishesDetail = load(filename)
        
        for i in 0..<self.dishesDetail.count {
            if let image_UrlString = self.dishesDetail[i].image_url,
               let imageUrl = URL(string: image_UrlString) {
                let imageView = UIImageView()
                imageView.kf.setImage(with: imageUrl) { [weak self] result in
                    switch result {
                    case .success(let imageResult):
                        DispatchQueue.main.async {
                            self?.dishesDetail[i].image = imageResult.image
                        }
                    case .failure(let error):
                        print("Failed to load image: \(error)")
                    }
                }
            }
        }
    }
    
//    func loadDishesDetailData() {
//        let filename = "dishesDetailData.json"
//        self.dishesDetail = load(filename)
//
//        for i in 0..<self.dishesDetail.count {
//            if let image_UrlString = self.dishesDetail[i].image_url,
//               let image_Url = URL(string: image_UrlString) {
//                loadImage(from: image_Url) { [weak self] loadedImage in
//                    DispatchQueue.main.async {
//                        self?.dishesDetail[i].image = loadedImage
//                    }
//                }
//            }
//        }
//    }
    
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

func loadDishes<T: Decodable>(_ filename: String) -> T {
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
