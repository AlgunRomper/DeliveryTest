//
//  HomeAllInOne.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import UIKit

func combineImages(image1: UIImage, image2: UIImage) -> UIImage? {
    let totalHeight = image1.size.height + image2.size.height + 10
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: max(image1.size.width, image2.size.width), height: totalHeight), false, 0.0)
    
    let image1Origin = CGPoint(x: (image1.size.width - max(image1.size.width, image2.size.width)) / 2, y: 0)
    let image2Origin = CGPoint(x: (image2.size.width - max(image1.size.width, image2.size.width)) / 2, y: image1.size.height + 10)
    
    image1.draw(at: image1Origin)
    image2.draw(at: image2Origin)
    
    let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return combinedImage
}
