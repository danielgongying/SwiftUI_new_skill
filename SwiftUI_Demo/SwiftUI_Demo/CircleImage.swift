//
//  CircleImage.swift
//  SwiftUI_Demo
//
//  Created by daniel on 12/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("2").resizable().frame(width: 320, height: 200, alignment: .center).clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 4))
                    .shadow(radius: 10)
        
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
