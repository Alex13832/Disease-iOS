//
//  CustomImage.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct CustomImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fit)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(image: Image("brainiac"))
    }
}
