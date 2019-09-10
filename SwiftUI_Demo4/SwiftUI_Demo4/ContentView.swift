//
//  ContentView.swift
//  SwiftUI_Demo4
//
//  Created by daniel on 13/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var showDetails = false
    @State var fruit = "apple"
    @State var value = 10
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
    
            Button(action: {
                self.showDetails.toggle()
                print("click button")
            }) {
                Image("china")
                Text("show details")
                .color(.gray)
                .font(.title)
                
            }
            if showDetails{
                Text("this is the details,rerewfadfjkljklj jiouieouwr m,jkl dlksjf lajfkl as").font(.largeTitle).animation(.spring())
                .lineLimit(nil)
            }
            HStack(alignment: VerticalAlignment.bottom, spacing: 10) {
                //textfield
                Text("nickName:")
                TextField($fruit)
                    .border(Color.green,width: 4)
                    .opacity(0.5)
                    .shadow(radius: 10)
                    .padding(.leading,20)
                
             
            }
        
            
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
