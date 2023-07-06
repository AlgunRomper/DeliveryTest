//
//  HomeTabItem.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import SwiftUI

struct HomeTabItem: View {
    var body: some View {
            if let svgData = UIPasteboard.general.data(forPasteboardType: "public.svg-image"),
               let image = UIImage(data: svgData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32) // Установите желаемые размеры изображения
            } else {
                Text("Символ SVG не найден в буфере обмена")
            }
        }
}

struct HomeTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabItem()
    }
}
