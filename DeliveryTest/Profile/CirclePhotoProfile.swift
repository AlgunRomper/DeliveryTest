//
//  CirclePhotoProfile.swift
//  DeliveryTest
//
//  Created by Algun Romper  on 30.06.2023.
//

import SwiftUI

struct CirclePhotoProfile: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

struct CirclePhotoProfile_Previews: PreviewProvider {
    static var previews: some View {
        CirclePhotoProfile(image: Image("Unknown"))
    }
}
