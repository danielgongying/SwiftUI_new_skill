//
//  ContentView.swift
//  SwiftUI_Demo7
//
//  Created by daniel on 14/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI
import CryptoKit
struct ContentView : View {
    @State private var index = 0 // 默认选中索引
    
    let imgs = ["hot","recommend","search","tag","setting"]

    var body: some View {
     
        TabbedView(selection: $index) {
            ForEach(0 ..< imgs.count) { item in
                TabItemPage(index: item)
                    .tabItemLabel(Image(self.imgs[item]))
                    .tag(item)
              
               
            }
            }.navigationBarTitle(Text("TabBar"))
    
    }
}
fileprivate struct TabItemPage: View {
    
    var index: Int
    
    var body: some View {
      
            VStack {
                Text("\(index+1)")
                    .color(.blue)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
                
          
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
