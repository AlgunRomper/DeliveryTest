//
//  FavoriteButton.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 02.07.2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 30, height: 30)
                .foregroundColor(Color.white.opacity(0.2))
            Button {
                isSet.toggle()
            } label: {
                Label ("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .red : .gray)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
    }
}
