//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by daniel on 12/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI
import MapKit
struct ContentView : View {
    let array = ["haha1","fdsfdsf","bcbvcbcv00"]
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("haha").font(.title).color(.blue)
//             Text("haha").font(.title).color(.blue)
//             Text("haha").font(.title).color(.blue)
//             Text("haha").font(.title).color(.blue)
//             Text("haha").font(.title).color(.blue)
//
//            Image("2").resizable().frame(width: 320, height: 200, alignment: .center).clipShape(Circle())
//            .overlay(Circle().stroke(Color.white,lineWidth: 4))
//            .shadow(radius: 10)
//
//        }
        newone()
    }
    
    func newone()-> some View {
     return
        VStack {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            Button(action: {
                print("click button")
            
            }) {
                Text("I'm a Button").bold()
                .font(.system(size: 20,design: .rounded))
                    .shadow(radius: 1)
                }.offset(y:0)
       
            
       
 
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                    
                }
                }
                .padding()
                Spacer()
        }
    
        }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
