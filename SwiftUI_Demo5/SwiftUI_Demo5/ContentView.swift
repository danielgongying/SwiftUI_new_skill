//
//  ContentView.swift
//  SwiftUI_Demo5
//
//  Created by daniel on 13/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    let posts = ["1","2","3"]
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment:.leading){
                    Text("trending")
                    ScrollView {
                        VStack(alignment:.leading) {
                         
                            HStack {
                                NavigationButton(destination: groupDetailView()) {
                                    groupView()
                                }
                        
                                groupView()
                                groupView()
                                groupView()
                                groupView()
                                groupView()
                                groupView()
                                groupView()
                                groupView()
                                
                            }
                        
                        }
                        
                        
                        }.frame(height:200)
                }
        
                //post rows
                ForEach(posts.identified(by: \.self)){post in
                    postView()
                    
                }
            }
        }.navigationBarTitle(Text("Groups"), displayMode: NavigationBarItem.TitleDisplayMode.large)
    }
}
struct groupDetailView:View {
    var body: some View {
        Text("detail view")
    }
}
struct groupView:View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("view")
                .renderingMode(.original)//button 蓝色覆盖
                .resizable()
                .clipShape(Circle())
                .frame(width: 80, height: 80, alignment: .center)
                .clipped()                .overlay(Circle().stroke(Color.gray,lineWidth: 2))
            
            Text("this is what i want ")
                .color(.primary)//button蓝色覆盖
                .lineLimit(nil).padding(.leading,0)
        }.frame(width: 110, height: 170, alignment: .leading)
        
    }
}
struct postView:View {
    var body: some View {
 
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image("headphone")
                .resizable()
                .clipShape(Circle())
                    .frame(width:60,height: 60)
                .clipped()
                VStack(alignment: .leading, spacing: 4){
                     Text("username").font(.headline)
                     Text("posted 8hr ago").font(.subheadline)
                }.padding(.leading,8)
               
            }.padding(.leading,16).padding(.top,16)
         
            Text("this is what i want,ahahaha,i want to do it again.come on, baby ").font(.subheadline).lineLimit(nil)
            .padding(.leading,16)
            .padding(.trailing,32)
            Image("view")
            .resizable()
            .frame(width:420,height: 300)
            .clipped()
            .border(Color.white,width: 1)
            .shadow(radius: 10)
        }.padding(.leading,-20).padding(.bottom,-8)
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
